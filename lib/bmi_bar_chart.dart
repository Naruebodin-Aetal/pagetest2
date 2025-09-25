import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiChartPage extends StatelessWidget {
  const BmiChartPage({super.key});

    // ฟังก์ชันแปลงค่า BMI เป็นสถานะ
  String bmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'ผอม';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'ปกติ';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'น้ำหนักเกิน';
    } else {
      return 'อ้วน';
    }
  }

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (uid.isEmpty) {
      return const Center(child: Text('กรุณาเข้าสู่ระบบเพื่อดูกราฟ BMI'));
    }
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('user')
          .doc(uid) // ใส่ userId ของคุณ
          .collection('records')
          .orderBy('date')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        // สร้างจุดกราฟและ label วันที่
        final bmiSpots = <FlSpot>[];
        final dateLabels = <String>[];
        for (int i = 0; i < docs.length; i++) {
          final data = docs[i].data() as Map<String, dynamic>;
          final bmi = (data['bmi'] ?? 0).toDouble();
          final date = (data['date'] as Timestamp?)?.toDate() ?? DateTime.now();
          bmiSpots.add(FlSpot(i.toDouble(), bmi));
          dateLabels.add("${date.month}/${date.day}");
        }

        if (bmiSpots.isEmpty) {
          return const Center(child: Text('ไม่มีข้อมูลกราฟ BMI'));
        }

        double minY = bmiSpots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
        double maxY = bmiSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
        if (minY == maxY) {
          minY -= 2;
          maxY += 2;
        }

        return SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: LineChart(
              LineChartData(
                minY: minY,
                maxY: maxY,
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blueAccent.withOpacity(0.8),
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final bmi = spot.y;
                        final status = bmiStatus(bmi);
                        return LineTooltipItem(
                          'BMI: ${bmi.toStringAsFixed(2)}\n$status',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      }).toList();
                    },
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: bmiSpots,
                    isCurved: true,
                    color: Colors.blue,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  )
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        int idx = value.toInt();
                        if (idx >= 0 && idx < dateLabels.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(dateLabels[idx]),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(value.toStringAsFixed(0)),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

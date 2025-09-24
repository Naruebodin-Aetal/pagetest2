import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiLineChart extends StatefulWidget {
  const BmiLineChart({super.key});

  @override
  State<BmiLineChart> createState() => _BmiLineChartState();
}

class _BmiLineChartState extends State<BmiLineChart> {
  List<FlSpot> spots = [];
  List<String> dateLabels = [];

  @override
  void initState() {
    super.initState();
    fetchBmiData();
  }

  Future<void> fetchBmiData() async {
    // ดึง uid ของ user ที่ล็อกอิน
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    // ดึงข้อมูลจาก subcollection ของ user นั้น
    final snapshot = await FirebaseFirestore.instance
        .collection('User1')
        .doc(uid)
        .collection('User1')
        .orderBy('date')
        .get();

    final List<FlSpot> tempSpots = [];
    final List<String> tempLabels = [];

    for (int i = 0; i < snapshot.docs.length; i++) {
      final doc = snapshot.docs[i];
      final bmi = (doc['bmi'] as num).toDouble();
      final dateField = doc['date'];
      DateTime date;
      if (dateField is Timestamp) {
        date = dateField.toDate();
      } else if (dateField is DateTime) {
        date = dateField;
      } else {
        continue;
      }
      tempSpots.add(FlSpot(i.toDouble(), bmi));
      tempLabels.add('${date.month}/${date.day}');
    }

    setState(() {
      spots = tempSpots;
      dateLabels = tempLabels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return spots.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                minY: 10,
                maxY: 40,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int idx = value.toInt();
                        if (idx >= 0 && idx < dateLabels.length) {
                          return Text(dateLabels[idx], style: const TextStyle(fontSize: 10));
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1,
                    ),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          );
  }
}

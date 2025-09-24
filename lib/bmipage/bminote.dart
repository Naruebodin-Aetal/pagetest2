import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagetest2/bmipage/bmimodel.dart';
import 'package:pagetest2/bmipage/bmipage.dart';

class Bminote extends StatelessWidget {
  const Bminote({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("บันทึก BMI  ทั้งหมด")),
      body: ListBmiData(),
    );
  }
}

class ListBmiData extends StatelessWidget {
  const ListBmiData({super.key});

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance
              .collection("user")
              .doc(name)
              .collection('records')
              .orderBy('date',descending: true)
              .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ListView(
          children:
              snapshot.data!.docs.map((document) {
                final data = document.data() as Map<String, dynamic>;
                String formattedDate = "";
                if (data["date"] != null) {
                  final timestamp = data["date"];
                  DateTime dateTime;
                  if (timestamp is Timestamp) {
                    dateTime = timestamp.toDate();
                  } else if (timestamp is DateTime) {
                    dateTime = timestamp;
                  } else {
                    dateTime =
                        DateTime.tryParse(timestamp.toString()) ??
                        DateTime.now();
                  }
                  formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
                }
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 80,
                      child: Text(
                        wordDeescriptToBmi(data['bmi']),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    title: Text(
                      formattedDate,
                      textScaler: TextScaler.linear(1.4),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BMI = ${(data['bmi']).toString()}'),
                        Text('ส่วนสูง = ${data['height'].toString()} เซนติเมตร'),
                        Text('น้ำหนัก = ${data['weight'].toString()} กิโลกรัม'),
                      ],
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}

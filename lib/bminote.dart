import 'package:flutter/material.dart';
import 'package:pagetest2/bmidata.dart';

class Bminote extends StatelessWidget {
  const Bminote({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("บันทึก")),
      body: Column(
        children: [
          ListBmiData(title: "ผอม/น้ำหนักน้อย", data: getData(1.1)),
          ListBmiData(title: "ปกติ", data: getData(18.5)),
          ListBmiData(title: "น้ำหนักเกิน", data: getData(25)),
          ListBmiData(title: "อ้วน", data: getData(30)),
        ],
      ),
    );
  }
}

class ListBmiData extends StatelessWidget {
  const ListBmiData({super.key, required this.title, required this.data});

  final String title;
  final BmiData data;

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'คำแนะนำด้านอาหาร',
                      textScaler: TextScaler.linear(1.3),
                    ),
                    Text(data.advicefood),
                    Text(
                      'คำแนะนำด้านการออกกำลังกาย',
                      textScaler: TextScaler.linear(1.3),
                    ),
                    Text(data.adviceworkout),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

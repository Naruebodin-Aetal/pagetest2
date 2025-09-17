import 'package:flutter/material.dart';
import 'package:pagetest2/bmipage/bmidata.dart';

class Bminote extends StatelessWidget {
  const Bminote({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("บันทึก")),
      body: Column(
        children: [
          
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
      
    );
  }
}

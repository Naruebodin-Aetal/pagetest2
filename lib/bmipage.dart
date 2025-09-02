import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  bool pressBtFirst = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(labelText: "น้ำหนัก(กิโลกรัม)"),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(labelText: "ส่วนสูง(เซนติเมตร)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pressBtFirst = true;
                    });
                  },
                  child: Text("คำนวณ"),
                ),
              ),
              if (pressBtFirst) showBlock(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget showBlock() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(20)),
      width: 500,
      height: 500,
      child: Column(),
    ),
  );
}

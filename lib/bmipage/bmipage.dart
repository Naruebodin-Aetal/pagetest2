import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pagetest2/bmipage/bmimodel.dart';
import '../validators.dart';

late String userid;

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Bmimodel data = Bmimodel();

  final _formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference collection = FirebaseFirestore.instance.collection(
    "user",
  );

  bool showResultBox = false;

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
        child: Image.asset(
          'assets/images/etc/bmipage.jpg',
          fit: BoxFit.cover,
        ),
      ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: const Text(
              'คำนวณค่าดัชนีมวลกาย (BMI)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 20,
                  children: [
                    description(),
                    form(),
                    showResultBox ? resultBox() : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget description() {
    return Card(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20),
        width: 600,
        child: Text("""
          การหาค่าดัชนีมวลกาย (Body Mass Index : BMI) 
          คือเป็นมาตรการที่ใช้ประเมินภาวะอ้วนและผอมในผู้ใหญ่ ตั้งแต่อายุ 20 ปีขึ้นไป 
          สามารถทำได้โดยการชั่งน้ำหนักตัวเป็นกิโลกรัม และวัดส่วนสูงเป็นเซนติเมตร 
          แล้วนำมาหาดัชมีมวลกาย โดยใช้โปรแกรมวัดค่าความอ้วนข้างต้น
          """),
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            width: 300,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "น้ำหนัก(กิโลกรัม)",
              ),
              validator: Validators.multiValidator([
                Validators.required(errorMessage: "กรุณากรอกข้อมูล"),
                Validators.numberValidator(errorMessage: "กรุณากรอกตัวเลข"),
                Validators.minValue(errorMessage: "เลขไม่ถูกต้อง", minValue: 1),
              ]),
              onChanged: (value) {
                data.weight = double.tryParse(value);
              },
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "ส่วนสูง(เซนติเมตร)",
              ),
              validator: Validators.multiValidator([
                Validators.required(errorMessage: "กรุณากรอกข้อมูล"),
                Validators.numberValidator(errorMessage: "กรุณากรอกตัวเลข"),
                Validators.minValue(errorMessage: "เลขไม่ถูกต้อง", minValue: 1),
              ]),
              onChanged: (value) {
                data.height = double.tryParse(value);
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                data.bmi = double.parse(
                  (data.weight! / ((data.height! / 100) * (data.height! / 100)))
                      .toStringAsFixed(2),
                );
                await collection.doc(userid).collection('records').add({
                  'weight': data.weight,
                  'height': data.height,
                  'date': DateTime.now(),
                  'bmi': data.bmi,
                });
                setState(() {
                  showResultBox = true;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20,
              ),
              child: Text(
                "คำนวณและบันทึก",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget resultBox() {
    return Card(
      color: Colors.white70,
      child: Container(
        padding: EdgeInsets.all(20),
        width: 500,
        height: 500,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ค่า BMI ที่ได้คือ ${data.bmi!.toString()}',
              textScaler: TextScaler.linear(1.5),
            ),
            Text("อยู่ในเกณฑ์ ${wordDeescriptToBmi(data.bmi!)}"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              height: 3,
              width: double.maxFinite,
            ),
            Text(
              "คำแนะนำด้านอาหารการกิน",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaler: TextScaler.linear(1.3),
            ),
            Text(data.getadviceFood()),
            Text(
              "คำแนะนำด้านการออกกำลังกาย",
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaler: TextScaler.linear(1.3),
            ),
            Text(data.getadviceWorkout()),
          ],
        ),
      ),
    );
  }
}

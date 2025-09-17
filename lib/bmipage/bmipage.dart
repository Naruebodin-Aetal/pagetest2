import 'package:flutter/material.dart';
import 'bmidata.dart';
import '../validators.dart';

double? sum;
double? bmi;

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  //ช่องแสดงครั้งแรกเมื่อกดปุ่มครั้งแรก
  bool pressBtFirst = false;
  //ตัวแปรส่วนสูงน้ำหนัก
  double? height;
  double? weight;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คำนวณดัชนีมวลกาย")),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "น้ำหนัก(กิโลกรัม)"),
                    validator: Validators.multiValidator([
                      Validators.required(errorMessage: "กรุณากรอกข้อมูล"),
                      Validators.numberValidator(
                        errorMessage: "กรุณากรอกตัวเลข",
                      ),
                      Validators.minValue(
                        errorMessage: "เลขไม่ถูกต้อง",
                        minValue: 1,
                      ),
                    ]),
                    onChanged: (value) {
                      weight = double.tryParse(value);
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "ส่วนสูง(เมตร)"),
                    validator: Validators.multiValidator([
                      Validators.required(errorMessage: "กรุณากรอกข้อมูล"),
                      Validators.numberValidator(
                        errorMessage: "กรุณากรอกตัวเลข",
                      ),
                      Validators.minValue(
                        errorMessage: "เลขไม่ถูกต้อง",
                        minValue: 1,
                      ),
                    ]),
                    onChanged: (value) {
                      height = double.tryParse(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (!_formKey.currentState!.validate()) {
                          pressBtFirst = false;
                          return;
                        }
                        pressBtFirst = true;
                        bmi = weight! / (height! * height!);
                      });
                    },
                    child: Text("คำนวณ"),
                  ),
                ),
                if (pressBtFirst)
                  showBlock(bmi!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String bmiStatus(double bmi) {
  if (bmi < 18.5)
    return "ผอม/น้ำหนักน้อย";
  else if (bmi >= 18.5 && bmi <= 24.9)
    return "ปกติ";
  else if (bmi >= 25 && bmi <= 29.9)
    return "น้ำหนักเกิน";
  else
    return "อ้วน";
}

Widget showBlock(double bmi) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Text(
                "BMI = ${bmi.toStringAsFixed(2)}",
                textScaler: TextScaler.linear(1.5),
              ),
            ),
            Card(
              child: Text(
                "อยู่ในเกณฑ์ : ${bmiStatus(bmi)}",
                textScaler: TextScaler.linear(1.5),
              ),
            ),
            CardTopic(
              title: getData(bmi).advicefood,
              topic: "คำแนะนำอาหาร",
            ),
            CardTopic(
              title: getData(bmi).adviceworkout,
              topic: "คำแนะนำออกกำลังกาย",
            ),
          ],
        ),
      ),
    ),
  );
}

class CardTopic extends StatelessWidget {
  final String title;
  final String topic;

  const CardTopic({super.key, required this.title, required this.topic});

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(topic), Text(title)],
          ),
        ),
      ),
    );
  }
}

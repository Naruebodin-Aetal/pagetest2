import 'package:flutter/material.dart';
import 'validators.dart';

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
              spacing: 10,
              children: [
                SizedBox(
                  width: 200,
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
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "ส่วนสูง(เซนติเมตร)",
                    ),
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
                      });
                    },
                    child: Text("คำนวณ"),
                  ),
                ),
                if (pressBtFirst) showBlock(weight!, height!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget showBlock(double weight, double height) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      width: 500,
      height: 500,
      child: Column(
        children: [
          Text((weight + height).toString())
        ],
      ),
    ),
  );
}

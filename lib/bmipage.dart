import 'package:flutter/material.dart';
import 'validators.dart';

double? sum;

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
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "BMI = ${(weight / (height * height)).toStringAsFixed(2)}",
                  textScaler: TextScaler.linear(1.5),
                ),
                Text(
                  "อยู่ในเกณฑ์ : ${bmiStatus(weight / (height * height))}",
                  textScaler: TextScaler.linear(1.5),
                ),
              ],
            ),
            cardtopic(
              title: getData(weight / (height * height)).advicefood,
              topic: "คำแนะนำอาหาร",
            ),
            cardtopic(
              title: getData(weight / (height * height)).adviceworkout,
              topic: "คำแนะนำออกกำลังกาย",
            ),
          ],
        ),
      ),
    ),
  );
}

class cardtopic extends StatelessWidget {
  final String title;
  final String topic;

  const cardtopic({super.key, required this.title, required this.topic});

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(topic), Text(title)],
        ),
      ),
    );
  }
}

BmiData getData(double bmi) {
  List<BmiData> data = [
    BmiData(
      advicefood: """
      -กินอาหารครบ 3 มื้อรวมกับของว่าง
      -เพิ่มโปรตีน(เนื้อสัตว์ไม่ติดมัน, ไข่, นม, ถั่ว)
      -เพิ่มคาร์บเชิงซ้อน (ข้าวกล้อง , ธัญพืช, มัน)
      -กินอาหารที่ให้พลังงานมากขึ้นอย่างพอดี
      """,
      adviceworkout: """
      -เน้นเวทเทรนนิ่งเพื่อเพิ่มมวลกล้ามเนื้อ
      -คาร์ดิโอเบาๆ เช่นเดิน, ปั่นจักรยาน 2-3 วันต่อสัปดาห์
      """,
    ),
    BmiData(
      advicefood: """
      -รักษาสมดุลอาหาร 5 หมู่ 
      -กินผักและผลไม้เป็นประจำ
      -เลี่ยงของทอดหวานจัดและอาหารแปรรูป
      """,
      adviceworkout: """
      -ออกกำลังกาย 3-5 วันต่อสัปดาห์
      -ผลผสมคาร์ดิโอ(วิ่ง, ว่ายน้ำ, เดินเร็ว) + เวทเทรนนิ่ง
      -เสริมโยคะ/ยืดเหยียดเพื่อสุขภาพ
      """),
    BmiData(
      advicefood: """
      -ลดอาหารที่มันจัด เค็มจัด หวานจัด
      -เพิ่มผัก ผลไม้ และโปรตีนไขมันต่ำ (ปลา, ไก่, เต้าหู้)
      -กินในปริมาณพอดี ไม่กินจุกจิก
      """,
      adviceworkout: """
      -คาร์ดิโอปานกลาง–หนัก 4 วันต่อสัปดาห์ (วิ่ง, ปั่นจักรยาน, HIIT) 
      -เวทเทรนนิ่งเบา–ปานกลาง 2-3 วันต่อสัปดาห์
      """),
    BmiData(
      advicefood: """
      -ควบคุมอาหารอย่างเคร่งครัด 
      -ลดอาหารที่มันจัด เค็มจัด ของหวาน
      -เน้นอาหารธรรมชาติ ผักและโปรตีนไม่ติดมัน
      -ปรึกษาแพทย์/นักโภชนาการร่วมด้วย
      """,
      adviceworkout: """
      -เริ่มจากคาร์ดิโอเบาๆ (เดิน, ช้าๆ, ว่ายน้ำ, ปั่นจักรยาน) เพื่อให้ร่างกายคุ้นชิน 
      -เพิ่มความหนักเมื่อร่างกายแข็งแรงขึ้น - เวทเทรนนิ่งเพื่อเสริมกล้ามเนื้อ 
      -เน้นความสม่ำเสมอ ไม่หักโหม 
      """),
  ];
  int index;

  if (bmi < 18.5)
    index = 0;
  else if (bmi >= 18.5 && bmi <= 24.9)
    index = 1;
  else if (bmi >= 25 && bmi <= 29.9)
    index = 2;
  else
    index = 3;

  return data[index];
}

class BmiData {
  const BmiData({required this.advicefood, required this.adviceworkout});

  final String advicefood;
  final String adviceworkout;
}

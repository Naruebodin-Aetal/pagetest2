import 'package:flutter/material.dart';
import 'package:pagetest2/bminote.dart';
import 'bmipage.dart';
import 'page2.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstRoute(), // หรือ widget หลักของคุณ
    ),
  );
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, required this.title,required this.page});
  
  //หัวข้อของปุ่ม
  final String title;
  //หน้าที่ต้องการไป
  final Widget page;

  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รักสุขภาพ')),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            ButtonApp(title: "คำนวณดัชนีมวลกาย", page: const BMIPage()),
            ButtonApp(title: "ผักและการออกกำลังกาย", page: const Page2()),
            ButtonApp(title: "บันทึก",page:const Bminote())
          ],
        ),
      ),
    );
  }
}


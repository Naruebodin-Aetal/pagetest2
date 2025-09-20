import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pagetest2/bmipage/bminote.dart';
import 'package:pagetest2/firebase/firebase_options.dart';
import '../bmipage/bmipage.dart';
import '../information_page/page2.dart';
import 'slidepic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstRoute(), // หรือ widget หลักของคุณ
    ),
  );
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, required this.title, required this.page});

  //หัวข้อของปุ่ม
  final String title;
  //หน้าที่ต้องการไป
  final Widget page;

  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Center(child: const Text('มาสุขภาพดีด้วยกันเถอะ')),backgroundColor: Colors.limeAccent[400],),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/formain/background.jpg"), // Your image asset path
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          children: [
            SizedBox(height: 5),
            SlidePic(),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 220,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.5); // สีเมื่อกดปุ่ม
                            }
                            return null; // ใช้สีเริ่มต้น
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // ปรับเหลี่ยม (4 = เหลี่ยมมาก)
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BMIPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 16, color: Colors.white),
                          SizedBox(width: 8),
                          const Text(
                            "คำนวณดัชนีมวลกาย",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  SizedBox(
                    width: 220,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.5); // สีเมื่อกดปุ่ม
                            }
                            return null; // ใช้สีเริ่มต้น
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // ปรับเหลี่ยม (4 = เหลี่ยมมาก)
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Page2()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.run_circle_sharp, size: 14, color: Colors.white),
                          SizedBox(width: 8),
                          const Text(
                            "ผักและการออกกำลังกาย",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  SizedBox(
                    width: 220,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue.withOpacity(0.5); // สีเมื่อกดปุ่ม
                            }
                            return null; // ใช้สีเริ่มต้น
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), // ปรับเหลี่ยม (4 = เหลี่ยมมาก)
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Bminote()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.analytics_outlined, size: 30, color: Colors.white),
                          SizedBox(width: 8),
                          const Text(
                            "บันทึก",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

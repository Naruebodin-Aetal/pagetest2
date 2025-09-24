import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pagetest2/bmipage/bminote.dart';
import 'package:pagetest2/firebase/firebase_options.dart';
import 'loginScreen.dart';
import '../bmipage/bmipage.dart';
import '../information_page/page2.dart';
import 'slidepic.dart';
import '../firebase/authenticationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.limeAccent[400])),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ภาพพื้นหลังเบลอ
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/formain/background2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 4,
            title: const Text(
              'Healthy Care',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
                AuthenticationService().logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
                
            },
          ),],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SlidePic(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                  child: Column(
                    children: [
                      _buildMenuButton(
                        context,
                        title: "คำนวณดัชนีมวลกาย",
                        color: Colors.green,
                        icon: Icons.monitor_weight_outlined,
                        page: const BMIPage(),
                      ),
                      const SizedBox(height: 16),
                      _buildMenuButton(
                        context,
                        title: "Healthy & Exercise",
                        color: Colors.pink,
                        icon: Icons.fitness_center,
                        page: const Page2(),
                      ),
                      const SizedBox(height: 16),
                      _buildMenuButton(
                        context,
                        title: "บันทึก",
                        color: Colors.deepOrange,
                        icon: Icons.analytics_outlined,
                        page: const Bminote(),
                        fontSize: 20,
                      ),
                      //const SizedBox(height: 20),
                    ],
                  ),
                ),
                Card(
                  shadowColor: Colors.black54,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'ยินดีต้อนรับสู่แอปพลิเคชันสุขภาพของเรา! '
                      'คุณสามารถคำนวณ BMI, ศึกษาข้อมูลการดูแลสุขภาพ '
                      'และบันทึกข้อมูลสุขภาพของคุณได้อย่างสะดวก '
                      'มาร่วมเดินทางสู่สุขภาพที่ดีไปด้วยกันเถอะ! 💪🍎',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // menu button widget
  Widget _buildMenuButton(
    BuildContext context, {
    required String title,
    required Color color,
    required IconData icon,
    required Widget page,
    double fontSize = 16,
  }) {
    return SizedBox(
      width: 240,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
          shadowColor: Colors.black45,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

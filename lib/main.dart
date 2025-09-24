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
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    ),
  );
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Blur
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

        // Main Scaffold
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
              'Healthy Care',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  AuthenticationService().logout();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SlidePic(),
                const SizedBox(height: 20),

                // Dashboard Section (แถวเดียวเรียงลงมา)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildDashboardCard(
                        context,
                        title: "คำนวณ BMI",
                        icon: Icons.edit_location_alt_rounded,
                        color: Colors.green,
                        page: const BMIPage(),
                      ),
                      const SizedBox(height: 16),
                      _buildDashboardCard(
                        context,
                        title: "Healthy & Exercise",
                        icon: Icons.fitness_center,
                        color: Colors.pink,
                        page: const Page2(),
                      ),
                      const SizedBox(height: 16),
                      _buildDashboardCard(
                        context,
                        title: "บันทึก",
                        icon: Icons.analytics_outlined,
                        color: Colors.deepOrange,
                        page: const Bminote(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Welcome Card
                Card(
                  shadowColor: Colors.black54,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: const [
                        Icon(Icons.favorite, size: 48, color: Colors.redAccent),
                        SizedBox(height: 12),
                        Text(
                          'ยินดีต้อนรับสู่แอปพลิเคชันสุขภาพของเรา!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'คุณสามารถคำนวณ BMI, ศึกษาข้อมูลการดูแลสุขภาพ '
                          'และบันทึกข้อมูลสุขภาพของคุณได้อย่างสะดวก '
                          'มาร่วมเดินทางสู่สุขภาพที่ดีไปด้วยกันเถอะ! 💪🍎',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Dashboard Card (แบบเต็มแถว)
  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        color: color.withOpacity(0.9),
        child: Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

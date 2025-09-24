import 'package:flutter/material.dart';
import '../firebase/authenticationService.dart';
import 'main.dart';
import 'dart:ui';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Stack(
      children: [
        // พื้นหลังเบลอ
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/formain/3296551_16321.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        // เนื้อหาไม่เบลอ
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('เข้าสู่ระบบ'),
            backgroundColor: Colors.blueAccent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 48),
                    // ช่องกรอกอีเมล
                    Card(
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'อีเมล',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ช่องกรอกรหัสผ่าน
                    Card(
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'รหัสผ่าน',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // ปุ่ม Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          AuthenticationService().login(email, password).then((success) {
                            if (success) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const FirstRoute(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('เข้าสู่ระบบล้มเหลว')),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ปุ่ม Register
                    TextButton(
                      onPressed: () {
                        AuthenticationService().register(email, password).then((success) {
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ลงทะเบียนสำเร็จ')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ลงทะเบียนล้มเหลว')),
                            );
                          }
                        });
                      },
                      child: const Text(
                        'ลงทะเบียน',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

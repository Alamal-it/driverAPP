import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            const Spacer(),

            Image.asset(
              "assets/images/alamal_logo.png",
              width: 230,
            ),

            const SizedBox(height: 40),

            const Text(
              "مندوب التوصيل",
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff0E4595),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Delivery Driver",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 80),

            Container(
              width: 250,
              height: 6,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xff0E4595),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 90),

            const Icon(
              Icons.local_shipping_outlined,
              size: 65,
              color: Color(0xff0E4595),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
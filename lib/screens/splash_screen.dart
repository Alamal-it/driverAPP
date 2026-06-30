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

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),

              Image.asset(
                'assets/images/alamal_logo.png',
                width: 200,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              const Text(
                'مندوب التوصيل',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E4595),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Delivery Driver',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0E4595),
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 70),

              Container(
                width: 220,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EDF5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E4595),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 80),

              const Icon(
                Icons.local_shipping_outlined,
                size: 60,
                color: Color(0xFF0E4595),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class DeliverySuccessScreen extends StatelessWidget {
  final File image;

  const DeliverySuccessScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        title: const Text(
          "تم التسليم",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 15),

            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xffDFF5DD),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "تم تسليم الطلب بنجاح",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "شكراً لك، تم تحديث حالة الطلب.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [

                  const Text(
                    "رقم الطلب",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "#ORD-0015",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff0E4595),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(height: 35),

                  const Text(
                    "إثبات التسليم",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0E4595),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: const Text(
                  "العودة للرئيسية",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainNavigationScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
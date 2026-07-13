import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main_navigation_screen.dart';

class DeliveryProofScreen extends StatefulWidget {
  const DeliveryProofScreen({super.key});

  @override
  State<DeliveryProofScreen> createState() =>
      _DeliveryProofScreenState();
}

class _DeliveryProofScreenState
    extends State<DeliveryProofScreen> {
  File? image;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  void finishDelivery() {
    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("الرجاء التقاط صورة أولاً"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم تسليم الطلب بنجاح"),
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        title: const Text(
          "إثبات التسليم",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "التقط صورة للطلب بعد التسليم",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 25),

            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: image == null
                    ? const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 80,
                            color: Color(0xff0E4595),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "اضغط لالتقاط صورة",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: finishDelivery,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff0E4595),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "تأكيد التسليم",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
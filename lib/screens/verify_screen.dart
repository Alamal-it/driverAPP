import 'package:flutter/material.dart';
import 'delivery_proof_screen.dart';
class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  void verifyCode() {
    String code = controllers.map((e) => e.text).join();

    if (code.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("الرجاء إدخال رمز التحقق"),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const DeliveryProofScreen(),
      ),
    );
  }

  Widget otpBox(
    TextEditingController controller,
    BuildContext context,
  ) {
    return SizedBox(
      width: 65,
      height: 70,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff0E4595),
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xffD9E3F5),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xff0E4595),
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        title: const Text(
          "رمز التحقق",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Icon(
              Icons.verified_user,
              size: 90,
              color: Color(0xff0E4595),
            ),

            const SizedBox(height: 25),

            const Text(
              "أدخل رمز التحقق",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "تم إرسال رمز التحقق إلى العميل",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otpBox(controllers[0], context),
                otpBox(controllers[1], context),
                otpBox(controllers[2], context),
                otpBox(controllers[3], context),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0E4595),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "تحقق",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

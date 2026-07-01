import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());

  void verifyCode() {
    String code = controllers.map((e) => e.text).join();

    if (code.length != 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 90,
          ),
          content: Text(
            "الرجاء إدخال رمز التحقق كاملاً",
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ResetPasswordScreen(),
      ),
    );
  }

  Widget otpBox(int index) {
    return SizedBox(
      width: 55,
      height: 60,
      child: TextField(
        controller: controllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,

        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff0E4595),
        ),

        decoration: InputDecoration(
          counterText: "",

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffD7E1F1),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xff0E4595),
              width: 2,
            ),
          ),
        ),

        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            FocusScope.of(context).nextFocus();
          }

          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),

          child: Column(
            children: [
              const SizedBox(height: 80),

              const Text(
                "التحقق من الرمز",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0E4595),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "ادخل رمز التحقق المرسل إلى\n+966 5XXXXXXXX",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Color(0xff8099C5),
                ),
              ),

              const SizedBox(height: 70),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  otpBox(0),
                  otpBox(1),
                  otpBox(2),
                  otpBox(3),
                  otpBox(4),
                ],
              ),

              const SizedBox(height: 80),

              const Text(
                "لم يصلك الرمز؟",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0E4595),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  // إعادة إرسال الرمز لاحقاً
                },
                child: const Text(
                  "إعادة إرسال الرمز (00:45)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff74C6F7),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  onPressed: verifyCode,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff0E4595),

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "تحقق",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
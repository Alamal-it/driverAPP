import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final TextEditingController phoneController =
      TextEditingController();

  String selectedCountry = "🇸🇦 +966";

  final List<String> countries = [
    "🇸🇦 +966",
    "🇦🇪 +971",
    "🇰🇼 +965",
    "🇧🇭 +973",
    "🇶🇦 +974",
    "🇴🇲 +968",
    "🇪🇬 +20",
    "🇯🇴 +962",
    "🇱🇧 +961",
    "🇺🇸 +1",
    "🇬🇧 +44",
    "🇫🇷 +33",
  ];

  void sendCode() {
    if (phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 120,
          ),
          content: Text(
            "الرجاء إدخال رقم الجوال",
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28),

            child: Column(
              children: [
                const SizedBox(height: 70),

                const Text(
                  "نسيت كلمة السر",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0E4595),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "أدخل رقم الجوال المرتبط بحسابك\nوسيتم إرسال رمز التحقق إليه",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.8,
                    color: Color(0xff8099C5),
                  ),
                ),

                const SizedBox(height: 85),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رقم الجوال",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0E4595),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xffD7E1F1),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x08000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff0E4595),
                            ),
                            style: const TextStyle(
                              color: Color(0xff0E4595),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            items: countries.map((country) {
                              return DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value!;
                              });
                            },
                          ),
                        ),
                      ),

                      Container(
                        width: 1,
                        height: 35,
                        color: const Color(0xffD7E1F1),
                      ),

                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType:
                              TextInputType.number,

                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly,
                            LengthLimitingTextInputFormatter(
                                15),
                          ],

                          textAlign: TextAlign.right,

                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff0E4595),
                          ),

                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "5XXXXXXXX",
                            hintStyle: TextStyle(
                              color: Color(0xffB0BDD6),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Color(0xff8099C5),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 170),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: sendCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xff0E4595),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "إرسال رمز التحقق",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
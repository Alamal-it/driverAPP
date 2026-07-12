import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool rememberMe = false;

void login() {
  if (usernameController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 120,
        ),
        content: Text(
          "الرجاء إدخال اسم المستخدم وكلمة السر",
          textAlign: TextAlign.center,
        ),
      ),
    );
    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const MainNavigationScreen(),
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
                const EdgeInsets.symmetric(horizontal: 25),

            child: Column(
              children: [
                const SizedBox(height: 35),

                Image.asset(
                  "assets/images/alamal_logo.png",
                  width: 130,
                ),

                const SizedBox(height: 20),

                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0E4595),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "مرحباً بك، يرجى تسجيل الدخول للمتابعة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff8099C5),
                  ),
                ),

                const SizedBox(height: 45),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اسم المستخدم",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0E4595),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: usernameController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل اسم المستخدم",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xff8099C5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffD7E1F1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff0E4595),
                        width: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "كلمة السر",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0E4595),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ادخل كلمة السر",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xff8099C5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffD7E1F1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff0E4595),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "تذكرني على هذا الجهاز",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff8099C5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: rememberMe
                              ? const Color(0xff0E4595)
                              : Colors.white,
                          border: Border.all(
                            color: const Color(0xff0E4595),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: rememberMe
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0E4595),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "نسيت كلمة السر؟ ",
                          style: TextStyle(
                            color: Color(0xff0E4595),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "اضغط هنا",
                          style: TextStyle(
                            color: Color(0xff74C6F7),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
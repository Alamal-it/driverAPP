import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "حسابي",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            color: const Color(0xff0E4595),

            child: Column(
              children: [

                const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_outline,
                    size: 45,
                    color: Color(0xff0E4595),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "أحمد خالد",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "مندوب توصيل",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    Text(
                      "4.8",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(width: 10),

                    Icon(Icons.star,color: Colors.amber),
                    Icon(Icons.star,color: Colors.amber),
                    Icon(Icons.star,color: Colors.amber),
                    Icon(Icons.star,color: Colors.amber),
                    Icon(Icons.star,color: Colors.amber),

                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [

                infoCard(
                  "الهوية",
                  "135465768",
                  Icons.badge_outlined,
                ),

                const SizedBox(height:15),

                infoCard(
                  "رقم الجوال",
                  "0544345678",
                  Icons.phone_outlined,
                ),

                const SizedBox(height:15),

                infoCard(
                  "البريد الإلكتروني",
                  "ahmad@gmail.com",
                  Icons.email_outlined,
                ),

                const SizedBox(height:35),
                                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffE3E8F2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xff0E4595),
            size: 28,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff0E4595),
              ),
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0E4595),
            ),
          ),
        ],
      ),
    );
  }
}
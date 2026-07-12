import 'package:flutter/material.dart';

class ReturnsScreen extends StatelessWidget {
  const ReturnsScreen({super.key});

  final List<Map<String, String>> returns = const [
    {
      "id": "#ORD-0015",
      "reason": "العميل لايريد",
      "date": "19 مايو 2026",
      "price": "120 ر.س",
    },
    {
      "id": "#ORD-0020",
      "reason": "العنوان خاطئ",
      "date": "20 أغسطس 2026",
      "price": "99 ر.س",
    },
    {
      "id": "#ORD-0099",
      "reason": "رفض التسليم",
      "date": "8 أبريل 2026",
      "price": "75 ر.س",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        title: const Text(
          "المرتجعات",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: returns.length,
        itemBuilder: (context, index) {
          final item = returns[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Row(
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.15),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text(
                        "مرجع",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Text(
                      item["id"]!,
                      style: const TextStyle(
                        color: Color(0xff0E4595),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                Text(
                  item["reason"]!,
                  style: const TextStyle(
                    color: Color(0xff0E4595),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    Text(
                      item["price"]!,
                      style: const TextStyle(
                        color: Color(0xff0E4595),
                        fontSize: 18,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      item["date"]!,
                      style: const TextStyle(
                        color: Color(0xff0E4595),
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
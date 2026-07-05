import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String address;
  final String time;
  final String price;
  final String status;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.address,
    required this.time,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        title: Text(orderId),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              const Text(
                "تفاصيل الطلب",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0E4595),
                ),
              ),

              const SizedBox(height: 25),

              detailRow("رقم الطلب", orderId),
              detailRow("العنوان", address),
              detailRow("الوقت", time),
              detailRow("السعر", price),
              detailRow("الحالة", status),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff0E4595),
            ),
          ),
        ],
      ),
    );
  }
}
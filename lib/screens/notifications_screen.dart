import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "الإشعارات",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          NotificationCard(
            icon: Icons.inventory_2_outlined,
            iconColor: Colors.blue,
            title: "تم إسناد طلب جديد",
            orderId: "#ORD-4434",
            time: "منذ ساعتين",
          ),

          SizedBox(height: 15),

          NotificationCard(
            icon: Icons.location_on,
            iconColor: Colors.orange,
            title: "تم تعديل عنوان الطلب",
            orderId: "#ORD-4355",
            time: "منذ ساعة",
          ),

          SizedBox(height: 15),

          NotificationCard(
            icon: Icons.delete_outline,
            iconColor: Colors.red,
            title: "تم إلغاء الطلب",
            orderId: "#ORD-0879",
            time: "منذ 25 دقيقة",
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String orderId;
  final String time;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.orderId,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff0E4595),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                orderId,
                style: const TextStyle(
                  color: Color(0xff0E4595),
                ),
              ),

              const SizedBox(height: 25),

              Text(
                time,
                style: const TextStyle(
                  color: Color(0xff0E4595),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
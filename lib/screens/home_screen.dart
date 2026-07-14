import 'package:flutter/material.dart';
import 'orders_screen.dart';
import 'wallet_screen.dart';
import 'map_screen.dart';
import 'notifications_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

    appBar: AppBar(
  backgroundColor: const Color(0xff0E4595),
  elevation: 0,
  automaticallyImplyLeading: false,

  title: Row(
    children: [
      // الإشعارات (أقصى اليسار)
     IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const NotificationsScreen(),
      ),
    );
  },
  icon: const Icon(
    Icons.notifications_none,
    color: Colors.white,
  ),
),

      const Spacer(),

      // الاسم
      const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "مرحباً بك",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          Text(
            "أحمد خالد",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),

      const SizedBox(width: 10),

      // صورة الملف الشخصي (أقصى اليمين)
      const CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Color(0xff0E4595),
        ),
      ),
    ],
  ),
),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 18,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    children: [

      Switch(
        value: isAvailable,
        activeColor: Colors.white,
        activeTrackColor: Colors.green,
        inactiveTrackColor: Colors.red.shade300,
        onChanged: (value) {
          setState(() {
            isAvailable = value;
          });
        },
      ),

      const Spacer(),

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          const Text(
            "حالة التوفر",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            isAvailable
                ? "متاح للتوصيل"
                : "غير متاح للتوصيل",
            style: TextStyle(
              color: isAvailable
                  ? Colors.green
                  : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),

      const SizedBox(width: 12),

      CircleAvatar(
        radius: 18,
        backgroundColor: isAvailable
            ? Colors.green.shade100
            : Colors.red.shade100,
        child: Icon(
          Icons.power_settings_new,
          color: isAvailable
              ? Colors.green
              : Colors.red,
        ),
      ),
    ],
  ),
),
              const SizedBox(height: 25),

              const Text(
                "إحصائيات اليوم",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0E4595),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  statCard("12", "مكتملة", const Color(0xffDFF5DD)),
                  const SizedBox(width: 10),
                  statCard("3", "جارية", const Color(0xffDDE8FF)),
                  const SizedBox(width: 10),
                  statCard("1", "ملغية", const Color(0xffFFE0E0)),
                  const SizedBox(width: 10),
                  statCard("50", "إجمالي الطلبات",
                      const Color(0xffEAF4DD)),
                ],
              ),

              const SizedBox(height: 25),

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "عرض الكل",
                    style: TextStyle(
                      color: Color(0xff0E4595),
                    ),
                  ),
                  Text(
                    "آخر الطلبات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0E4595),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              orderCard(context, "#ORD-0015", "جازان - مخطط 6", "30 دقيقة"),
              const SizedBox(height: 10),

              orderCard(context, "#ORD-0316", "جازان - السويس", "45 دقيقة"),
              const SizedBox(height: 10),


              orderCard(context, "#ORD-0634", "جازان - المطار", "40 دقيقة"),
              const SizedBox(height: 10),

              orderCard(context, "#ORD-0741", "جازان - النسيم", "25 دقيقة"),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget statCard(
      String number,
      String title,
      Color color,
      ) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xff0E4595),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
    Widget orderCard(
    BuildContext context,
    String id,
    String location,
    String time,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OrdersScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 18,
            ),

            const Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  id,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  location,
                  style: const TextStyle(
                    color: Color(0xff0E4595),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(width: 12),

            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xffEAF1FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.location_on,
                color: Color(0xff0E4595),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
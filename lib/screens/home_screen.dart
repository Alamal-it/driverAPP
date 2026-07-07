import 'package:flutter/material.dart';
import 'orders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        onPressed: () {},
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xff0E4595),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const OrdersScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: "الطلبات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: "المحفظة",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "حسابي",
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "حالة التوفر",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.power_settings_new,
                            color: Colors.green,
                            size: 18,
                          ),
                        ),
                        const Text(
                          "متاح للتوصيل",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
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
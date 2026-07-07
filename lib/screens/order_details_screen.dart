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
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "تفاصيل الطلب",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xffAFC8F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "جديدة",
                      style: TextStyle(
                        color: Color(0xff0E4595),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "#ORD-0015",
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xff0E4595),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "29 مايو 2025",
                        style: TextStyle(
                          color: Color(0xff0E4595),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              infoCard(
                title: "معلومات العميل",
                icon: Icons.phone,
                right1: "أحمد العتيبي",
                right2: "+966 5XXXXXXXX",
              ),

              const SizedBox(height: 18),

              infoCard(
                title: "عنوان التوصيل",
                icon: Icons.location_on_outlined,
                right1: "جازان - السويس",
                right2: "شارع الخالدية",
              ),

              const SizedBox(height: 18),
                            infoCard(
                title: "معلومات الطلب",
                icon: Icons.receipt_long_outlined,
                right1: "نوع الدفع",
                right2: "كاش عند الاستلام",
                left1: "المبلغ المطلوب",
                left2: "120 ر.س",
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // الانتقال لصفحة الملاحة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0E4595),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "بدء التوصيل",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard({
    required String title,
    required IconData icon,
    required String right1,
    required String right2,
    String? left1,
    String? left2,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffD9E3F3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xff0E4595),
            size: 38,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xff0E4595),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                if (left1 == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        right1,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff0E4595),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        right2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff0E4595),
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            left1,
                            style: const TextStyle(
                              color: Color(0xff0E4595),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            left2!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff0E4595),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          Text(
                            right1,
                            style: const TextStyle(
                              color: Color(0xff0E4595),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            right2,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff0E4595),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
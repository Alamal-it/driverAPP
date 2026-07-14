import 'package:flutter/material.dart';
import 'settlement_screen.dart';
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "المحفظة",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// بطاقة الرصيد
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xff0E4595),
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [

                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 55,
                    color: Colors.white,
                  ),

                  const Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [

                      Text(
                        "النقد المحصل",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 8),

                      Row(
                        children: [

                          Text(
                            "ر.س",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),

                          SizedBox(width: 8),

                          Text(
                            "1,250",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: _infoCard(
                    title: "الطلبات المكتملة",
                    value: "12",
                    color: Colors.green,
                    icon: Icons.check_circle_outline,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _infoCard(
                    title: "الطلبات المرتجعة",
                    value: "3",
                    color: Colors.blueGrey,
                    icon: Icons.assignment_return,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: _infoCard(
                    title: "المبلغ المحصل",
                    value: "1,250",
                    color: Colors.orange,
                    icon: Icons.payments_outlined,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _infoCard(
                    title: "الطلبات الملغاة",
                    value: "2",
                    color: Colors.redAccent,
                    icon: Icons.cancel_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),
                        Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),

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

                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xff0E4595).withOpacity(.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Color(0xff0E4595),
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text(
                          "تسوية العهدة",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0E4595),
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "قم بتسليم العهدة للمسؤول في نهاية اليوم",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromARGB(255, 158, 158, 158),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0E4595),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

               onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const SettlementScreen(),
    ),
  );
},
                child: const Text(
                  "تسوية العهدة",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 34,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
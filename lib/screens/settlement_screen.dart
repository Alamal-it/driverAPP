import 'package:flutter/material.dart';

class SettlementScreen extends StatelessWidget {
  const SettlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "تسوية العهدة",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            const SizedBox(height: 30),

            const Center(
              child: Text(
                "يرجى تسليم المبلغ للصيدلي ومطابقته",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff0E4595),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            _item("النقد المحصل", "1,250 ر.س"),

            const SizedBox(height: 15),

            _item("إجمالي المرتجعات", "3 طلبات"),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.08),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: const [

                  Text(
                    "1,250 ر.س",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0E4595),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),

                  Text(
                    "المستحق تسليمه",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff0E4595),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              "ملاحظات",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff0E4595),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "اكتب ملاحظاتك هنا",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("تم تسليم العهدة بنجاح"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text(
                  "تسليم العهدة",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _item(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [

          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff0E4595),
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff0E4595),
            ),
          ),
        ],
      ),
    );
  }
}
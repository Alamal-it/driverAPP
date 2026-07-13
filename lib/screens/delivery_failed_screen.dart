import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';

class DeliveryFailedScreen extends StatefulWidget {
  const DeliveryFailedScreen({super.key});

  @override
  State<DeliveryFailedScreen> createState() =>
      _DeliveryFailedScreenState();
}

class _DeliveryFailedScreenState
    extends State<DeliveryFailedScreen> {
  final TextEditingController noteController =
      TextEditingController();

  String selectedReason = "العميل لم يرد";

  final List<String> reasons = [
    "العميل لم يرد",
    "العنوان غير صحيح",
    "العميل ألغى الطلب",
    "تعذر الوصول للموقع",
    "سبب آخر",
  ];

  void sendReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم إرسال سبب فشل التسليم"),
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: const Color(0xff0E4595),
        centerTitle: true,
        title: const Text(
          "فشل التسليم",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            const SizedBox(height: 10),

            const Text(
              "سبب فشل التسليم",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 25),

            DropdownButtonFormField<String>(
              value: selectedReason,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
              items: reasons
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            const Text(
              "ملاحظات",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff0E4595),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: noteController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "اكتب أي ملاحظات...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: sendReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xffE53935),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "إرسال",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
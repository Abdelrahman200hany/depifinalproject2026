import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ValidationWaitingView extends StatelessWidget {
  const ValidationWaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'طلب التحقق قيد المراجعة',
        wantedIconBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.imagesValiationWating, height: 220),

            const SizedBox(height: 30),

            const Text(
              "طلب التحقق قيد المراجعة",

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "تم إرسال صور التحقق بنجاح، يرجى الانتظار حتى يتم مراجعة الطلب.",

              textAlign: TextAlign.center,

              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

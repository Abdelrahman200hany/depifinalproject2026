import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ValidationApprovedView extends StatelessWidget {
  const ValidationApprovedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تم تأكيد الحساب بنجاح',
        wantedIconBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.imagesValiadrtionApproved, height: 220),

            const SizedBox(height: 30),

            const Text(
              "تم تأكيد الحساب بنجاح",

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "تمت مراجعة بياناتك والموافقة عليها، يمكنك استخدام جميع مميزات التطبيق.",

              textAlign: TextAlign.center,

              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

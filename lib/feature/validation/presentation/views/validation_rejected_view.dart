import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/validation/presentation/views/validation_screen.dart';
import 'package:flutter/material.dart';

class ValidationRejectedView extends StatelessWidget {
  const ValidationRejectedView({super.key, required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تم رفض طلب التحقق', wantedIconBack: true),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(Assets.imagesValidationRejected, height: 220),

            const SizedBox(height: 30),

            const Text(
              "تم رفض طلب التحقق",

              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Text(
              "سبب الرفض:\n$reason",

              textAlign: TextAlign.center,

              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 30),

            CustomTextBottomWithBackground(
              text: "حاول مرة أخرى",

              ontap: () {
                Navigator.pushNamed(
                  context,
                  AccountValidationView.routeName,
                ); // logic later
              },
            ),
          ],
        ),
      ),
    );
  }
}

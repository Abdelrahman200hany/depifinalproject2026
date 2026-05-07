import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:flutter/material.dart';

class FaulireCustomwidget extends StatelessWidget {
  const FaulireCustomwidget({super.key, this.ontap, required this.appBarhint});

  final void Function()? ontap;
  final String appBarhint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarhint),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 160),
              SizedBox(height: 16),
              Text(
                'حدث خطا اثناء التحميل ',
                style: AppStyle.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.red),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomTextBottomWithBackground(
                  backgroundColor: Colors.red,
                  text: 'اعد المحاوله',
                  ontap: ontap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomAskedTextButtom extends StatelessWidget {
  const CustomAskedTextButtom({
    super.key, this.onTap, required this.fristText, required this.secondText,
    
  });
  final void Function()? onTap;
  final String fristText, secondText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: fristText,
            style: AppStyle.styleBold16(context).copyWith(
              color: const Color(0xFF94A3B8),
            
            ),
          ),
          TextSpan(
            text: secondText,
            style: AppStyle.styleBold16(
              context,
            ).copyWith(color: AppColor.kPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
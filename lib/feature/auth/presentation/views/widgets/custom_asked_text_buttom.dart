import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomAskedTextButtom extends StatelessWidget {
  const CustomAskedTextButtom({
    super.key,
    this.onTap,
    required this.fristText,
    required this.secondText,
    this.textAlign = TextAlign.center,
  });
  final void Function()? onTap;
  final String fristText, secondText;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: textAlign,
      TextSpan(
        children: [
          TextSpan(
            text: fristText,
            style: AppStyle.styleSRegular16(
              context,
            ).copyWith(color: const Color(0xFF94A3B8)),
          ),
          TextSpan(
            text: secondText,
            style: AppStyle.styleSRegular16(
              context,
            ).copyWith(color: AppColor.kPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

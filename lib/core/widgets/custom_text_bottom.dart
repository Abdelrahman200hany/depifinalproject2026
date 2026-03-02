import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';


class CustomTextBottom extends StatelessWidget {
  const CustomTextBottom({
    super.key,
    this.onPressed,
    required this.text,
    required this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyle.styleSemiBold13(context).copyWith(color: textColor),
      ),
    );
  }
}

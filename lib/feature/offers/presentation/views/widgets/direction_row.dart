import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class DirectionRow extends StatelessWidget {
  const DirectionRow({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: AppColor.kPrimaryColor, size: 18),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppStyle.styleSemiBold13(
            context,
          ).copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
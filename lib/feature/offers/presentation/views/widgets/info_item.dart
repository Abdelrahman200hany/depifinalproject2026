import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.styleSRegular16(context)),

            const SizedBox(width: 12),
            Icon(icon, color: Colors.blue),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppStyle.styleSemiBold16(
            context,
          ).copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

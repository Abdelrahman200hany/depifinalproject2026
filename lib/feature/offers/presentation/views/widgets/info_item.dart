import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
    required this.value,
     this.onTap,
    required this.icon,
  });
  final String title;
  final String value;
  final IconData icon;
  final void Function()? onTap;

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
            GestureDetector(
              onTap: onTap,
              child: Icon(icon, color: Colors.blue),
            ),
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

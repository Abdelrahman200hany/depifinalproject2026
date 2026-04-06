
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class AddOrderSecTitle extends StatelessWidget {
  const AddOrderSecTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: AppStyle.styleSemiBold18(
          context,
        ).copyWith(color: const Color(0xFF333333)),
      ),
    );
  }
}

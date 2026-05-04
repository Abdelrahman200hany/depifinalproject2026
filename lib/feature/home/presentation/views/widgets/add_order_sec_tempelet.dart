
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AddOrderSecTempelet extends StatelessWidget {
  const AddOrderSecTempelet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.kPrimaryColordLight.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
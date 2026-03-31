import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 20,
      color: AppColor.kGreyAppColor.withValues(alpha: 0.4),
    );
  }
}
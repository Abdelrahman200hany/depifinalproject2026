import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomDoitsIndecator extends StatelessWidget {
  const CustomDoitsIndecator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      height: 10,
      width: isActive ? 36 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? AppColor.kPrimaryColordLight : AppColor.kGreyAppColor,
      ),
    );
  }
}

import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class NotActiveBottomNavigationBarItem extends StatelessWidget {
  const NotActiveBottomNavigationBarItem({
    super.key,
    required this.notActiveIcon,
  });
  final IconData notActiveIcon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(notActiveIcon, color: AppColor.kGreyAppColor, size: 22),
    );
  }
}

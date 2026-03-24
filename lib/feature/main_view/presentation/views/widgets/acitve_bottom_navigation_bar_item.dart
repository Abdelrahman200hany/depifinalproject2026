import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class ActiveBottomNavigationBarItem extends StatelessWidget {
  const ActiveBottomNavigationBarItem({
    super.key,
    required this.activeIcon,
    required this.name,
  });
  final String name;
  final IconData activeIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFeeeeee).withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Icon(activeIcon, color: Colors.white, size: 16),
              ),
            ),

            SizedBox(width: 4),
            Text(
              name,
              style: AppStyle.styleSemiBold11(
                context,
              ).copyWith(color: AppColor.kPrimaryColordLight),
            ),

            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

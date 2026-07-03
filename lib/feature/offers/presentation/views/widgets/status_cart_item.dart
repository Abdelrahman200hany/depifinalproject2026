import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class StatusCarditem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final bool isActive;
  final void Function()? onTap;

  const StatusCarditem({
    super.key,
    this.isActive = false,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
    this.iconColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 350),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive ? Colors.blue.shade200 : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: iconColor),
            const SizedBox(height: 15),
            Text(
              title,
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}

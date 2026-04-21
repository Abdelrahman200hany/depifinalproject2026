import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title, value, subtitle;
  final Color color;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyle.styleSRegular12(context)),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppStyle.styleBold23(
                  context,
                ).copyWith(color: Colors.black),
              ),
              Text(
                subtitle,
                style: AppStyle.styleSRegular12(context).copyWith(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

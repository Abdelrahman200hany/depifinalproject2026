import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class OrderItemDetailsSecDataWithWidget extends StatelessWidget {
  const OrderItemDetailsSecDataWithWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final Widget icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.black.withValues(alpha: 0.4),
          width: 0.5,
        ),
      ),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: AppStyle.styleBold16(
                      context,
                    ).copyWith(color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            const CustomDivider(),
            ...children,
          ],
        ),
      ),
    );
  }
}

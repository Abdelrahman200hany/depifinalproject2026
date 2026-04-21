import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class NoticationIconBottom extends StatelessWidget {
  const NoticationIconBottom({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: ShapeDecoration(
        color: AppColor.kPrimaryColor.withValues(alpha: 0.1),
        shape: OvalBorder(),
      ),
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.notification_add_outlined,
            color: AppColor.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

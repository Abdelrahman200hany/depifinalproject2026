
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class FiltterIcon extends StatelessWidget {
  const FiltterIcon({
this.onTap,
    super.key,
  });
 final  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.kPrimaryColor.withValues(alpha: 0.1),
        ),
        child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.filter_list_rounded,
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_decoration.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class OrderItemPrice extends StatelessWidget {
  const OrderItemPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: AppDecoration.greyBoxContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'قيمه الشحنه (جنية)',
              style: AppStyle.styleSRegular16(context),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '450',
            style: AppStyle.styleBold19(
              context,
            ).copyWith(color: AppColor.kPrimaryColor.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}

import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_decoration.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class OrderItemPrice extends StatelessWidget {
  const OrderItemPrice({
    super.key,
    required this.descrtionPrice,
    required this.pirce,
  });
  final String descrtionPrice;
  final double pirce;
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
              ' $descrtionPrice (جنية)',
              style: AppStyle.styleSRegular16(context),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '$pirce',
            style: AppStyle.styleBold19(
              context,
            ).copyWith(color: AppColor.kPrimaryColor.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}

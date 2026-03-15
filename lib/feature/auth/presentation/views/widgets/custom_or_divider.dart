
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomORDivider extends StatelessWidget {
  const CustomORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        SizedBox(width: 14),
        Text(
          'او',
          style: AppStyle.styleBold19(
            context,
          ).copyWith(color: AppColor.kPrimaryColor),
        ),
        SizedBox(width: 14),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}

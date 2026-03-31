
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItemHeader extends StatelessWidget {
  const OrderItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesActiveBox,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            AppColor.kPrimaryColor.withValues(alpha: 0.5),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8),
        Text('#FS-9991', style: AppStyle.styleSRegular16(context)),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColordLight.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),
          padding: EdgeInsets.all(4),
          child: Center(
            child: Text(
              'قيد التوصيل',
              style: AppStyle.styleSRegular13(
                context,
              ).copyWith(color: AppColor.kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

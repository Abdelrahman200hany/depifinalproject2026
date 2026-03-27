import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItemBody extends StatelessWidget {
  const OrderItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'ملابس - حذاء رياضي',

            style: AppStyle.styleSemiBold16(
              context,
            ).copyWith(color: AppColor.kPrimaryColor.withValues(alpha: 0.8)),
          ),
        ),
        SizedBox(height: 14),
        Row(
          children: [
            Icon(
              Icons.my_location_outlined,
              color: AppColor.kPrimaryColor.withValues(alpha: 0.5),
            ),
            SizedBox(width: 8),
            Text(
              'القاهرة _ مدينه نصر',
              style: AppStyle.styleSRegular16(context),
            ),
            Spacer(),
            Text(
              'من',
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: AppColor.kPrimaryColor),
            ),
          ],
        ),
        const SizedBox(height: 2),

        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SvgPicture.asset(
              Assets.imagesPositionLine,
              height: 24,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColor.kPrimaryColor,
                BlendMode.screen,
              ),
            ),
          ),
        ),

        const SizedBox(height: 2),

        Row(
          children: [
            Icon(
              Icons.edit_location_alt,
              color: Colors.red.withValues(alpha: 0.5),
            ),
            SizedBox(width: 8),
            Text(
              'الجيزة - حسن محمد ',
              style: AppStyle.styleSRegular16(context),
            ),
            Spacer(),
            Text(
              'الي',
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
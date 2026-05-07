import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCustomwidget extends StatelessWidget {
  const EmptyCustomwidget({
    super.key,
    required this.emptyText,
    required this.hint,
    required this.appBarhint,
  });
  final String emptyText;
  final String hint;
  final String appBarhint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarhint),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              SvgPicture.asset(
                Assets.imagesActiveBox,
                height: 180,
                colorFilter: ColorFilter.mode(
                  AppColor.kPrimaryColordLight.withValues(alpha: 0.9),
                  BlendMode.srcIn,
                ),
              ),

              SizedBox(height: 24),
              Text(
                'لم يتم العثور علي $emptyText',
                style: AppStyle.styleSemiBold16(
                  context,
                ).copyWith(color: Colors.black),
              ),
              SizedBox(height: 12),
              Text(
                hint,
                style: AppStyle.styleSRegular16(
                  context,
                ).copyWith(color: AppColor.kGreyAppColor),
              ),

              Spacer(),
              CustomTextBottomWithBackground(
                text: 'اضافه طلب جديد',
                ontap: () {
                  Navigator.pushNamed(context, AddOrderView.routeName);
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

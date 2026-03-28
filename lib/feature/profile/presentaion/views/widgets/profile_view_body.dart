import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/widgets/about_us_view_body.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/widgets/header_profile.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/widgets/sec_profile_body.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/widgets/sec_profile_body_with_switch_bottom.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'حسابي'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHoriztailPadding,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Headerprofile(),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'عام',
                  style: AppStyle.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xFF0C0D0D)),
                ),
              ),
              SizedBox(height: 16),
              CustomProfileSecDetails(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   PersonalDetailsViewSec.routeName,
                  // );
                },
                title: 'الملف الشخصي',
                icon: Icons.person_3_outlined,
              ),

              CustomProfileSecDetails(
                title: 'المدفوعات',
                icon: Icons.payments_outlined,
              ),

              CustomProfileSecDetailswithSwitchBottom(
                image: Assets.imagesNotification,
                title: 'الإشعارات',
              ),
              CustomProfileSecDetails(
                title: 'اللغة',
                icon: Icons.language_outlined,
              ),
              CustomProfileSecDetailswithSwitchBottom(
                image: Assets.imagesMagicpen,
                title: 'الوضع',
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المساعده',
                  style: AppStyle.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xFF0C0D0D)),
                ),
              ),
              CustomProfileSecDetails(
                onTap: () {
                  Navigator.pushNamed(context, AboutUsViewBody.routeName);
                },
                icon: Icons.info_outlined,
                title: 'من نحن',
              ),

              CustomProfileSecDetails(
                iconcolor: Colors.redAccent,
                icon: Icons.exit_to_app_outlined,
                title: 'تسجيل الخروج ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

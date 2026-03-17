import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_bottom_with_icon.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_up_view.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_asked_text_buttom.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: ListView(
            children: [
              SizedBox(height: 30.0),
              SizedBox(
                height: 80,
                width: 80,
                child: SvgPicture.asset(
                  Assets.imagesLogo,
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'مرحباً بعودتك',
                textAlign: TextAlign.center,
                style: AppStyle.styleBold19(
                  context,
                ).copyWith(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                'سجل الدخول لإدارة شحناتك وتتبع طرودك',
                textAlign: TextAlign.center,
                style: AppStyle.styleSRegular16(context),
              ),

              SizedBox(height: 30.0),
              CustomTextFormFeild(
                hint: 'name@company.com',
                textInputType: TextInputType.emailAddress,
                labelText: 'البريد الاكتروني',
              ),

              SizedBox(height: 16.0),
              CustomTextFormFieldForPasswoed(
                hint: '123sds@sd',

                labelText: 'كلمه المرور',
              ),

              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextBottom(
                  text: ' نسيت كلمة المرور؟',
                  textColor: AppColor.kPrimaryColor,
                ),
              ),
              SizedBox(height: 16.0),
              CustomTextBottomWithBackground(text: 'تسجيل دخول'),
              SizedBox(height: 24.0),
              CustomORDivider(),
              SizedBox(height: 24.0),
              CustomBottomWithICon(
                icon: SvgPicture.asset(Assets.imagesGoogleIcon),
                text: 'المتابعة باستخدام جوجل',
              ),
              SizedBox(height: 24.0),
              CustomAskedTextButtom(
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                fristText: 'ليس لديك حساب؟ ',
                secondText: ' إنشاء حساب',
              ),

              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

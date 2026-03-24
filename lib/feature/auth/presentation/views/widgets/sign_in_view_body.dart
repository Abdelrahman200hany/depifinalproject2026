import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_bottom_with_icon.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_in_cubit_file/sign_in_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/forget_password_view.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_up_view.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_asked_text_buttom.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.0),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: SvgPicture.asset(
                      Assets.imagesLogo,
                      colorFilter: ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcIn,
                      ),
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
                    validator: (value) => AppValidation.email(value),
                    onSaved: (value) {
                      email = value!.toLowerCase().trim();
                    },
                    textInputType: TextInputType.emailAddress,
                    labelText: 'البريد الاكتروني',
                  ),

                  SizedBox(height: 16.0),
                  CustomTextFormFieldForPasswoed(
                    validator: (value) => AppValidation.password(value),
                    onSaved: (value) {
                      password = value!;
                    },

                    labelText: 'كلمه المرور',
                  ),

                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextBottom(
                      text: ' نسيت كلمة المرور؟',
                      textColor: AppColor.kPrimaryColor,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ForgetPasswordView.routeName,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  AbsorbPointer(
                    absorbing: widget.isLoading ? true : false,
                    child: CustomTextBottomWithBackground(
                      isLoading: widget.isLoading,
                      text: 'تسجيل دخول',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          context
                              .read<SignInCubit>()
                              .signInWithEmailAndPassword(
                                passord: password,
                                email: email,
                              );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 24.0),
                  CustomORDivider(),
                  SizedBox(height: 24.0),
                  CustomSocailButtom(
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
        ),
      ),
    );
  }
}

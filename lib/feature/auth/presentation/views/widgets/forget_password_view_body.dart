import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'نسيان كلمه المرور', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Text(
                'لا تقليق ما عليك سوا كتابه البريد الاكتروني الخاص بك ',
                style: AppStyle.styleBold19(context),
              ),
              SizedBox(height: 24),
              CustomTextFormFeild(
                textInputType: TextInputType.emailAddress,
                labelText: 'البريد الاكتروني ',
              ),
              SizedBox(height: 24),
              CustomTextBottomWithBackground(text: 'اعاده تعين كلمه المرور'),
            ],
          ),
        ),
      ),
    );
  }
}


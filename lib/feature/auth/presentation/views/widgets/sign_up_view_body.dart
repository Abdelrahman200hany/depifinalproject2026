import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_data_list.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/accepts_term_widget.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_asked_text_buttom.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'انشاء حساب جديد ', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'مرحباً بك في فلاش',
              style: AppStyle.styleBold23(
                context,
              ).copyWith(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'قم بتعبئة البيانات التالية لتبدأ رحلتك معنا',
              style: AppStyle.styleSRegular13(context),
            ),
            const SizedBox(height: 24),

            CustomTextFormFeild(
              textInputType: TextInputType.name,
              labelText: 'الاسم الكامل',
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              textInputType: TextInputType.emailAddress,
              labelText: 'البريد الإلكتروني',
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              textInputType: TextInputType.phone,
              labelText: 'رقم الهاتف',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomDropDownButtom(
                    itemsList: AppDataList.egyptGovernorates,
                    hint: 'اختر المدينة',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomDropDownButtom(
                    hint: 'نوع الحساب',
                    itemsList: AppDataList.userType,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormFieldForPasswoed(
                    hint: '********',
                    labelText: 'كلمة المرور',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormFieldForPasswoed(
                    hint: '********',
                    labelText: 'تأكيد كلمة المرور',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AcceptsTermWidget(onChange: (value) {}, onTap: () {}),
            const SizedBox(height: 16),
            CustomTextBottomWithBackground(text: 'إنشاء حساب', ontap: () {}),
            const SizedBox(height: 16),
            CustomAskedTextButtom(
              fristText: 'لديك حساب بالفعل؟ ',
              secondText: 'تسجيل الدخول',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

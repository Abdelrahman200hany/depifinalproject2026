import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:flutter/material.dart';

class PersonalDetailsViewSec extends StatelessWidget {
  const PersonalDetailsViewSec({super.key});
  static const routeName = 'PersonalDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الملف الشخصي', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            SizedBox(height: 36),
            Text(
              'المعلومات الشخصيه',
              style: AppStyle.styleSemiBold13(
                context,
              ).copyWith(color: AppColor.kGreyAppColor),
            ),
            SizedBox(height: 24),
            CustomTextFormFeild(
              hint: 'أحمد ياسر',
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 18),
            CustomTextFormFeild(
              hint: 'mail@mail.com',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 18),
            Text(
              'تغيير كلمة المرور',
              style: AppStyle.styleSemiBold13(
                context,
              ).copyWith(color: AppColor.kGreyAppColor),
            ),
            SizedBox(height: 24),
            CustomTextFormFieldForPasswoed(hint: 'كلمة المرور الحالي'),
            SizedBox(height: 18),
            CustomTextFormFieldForPasswoed(hint: 'كلمة المرور الجديده'),
            SizedBox(height: 18),
            CustomTextFormFieldForPasswoed(hint: 'تأكيد كلمة المرور الجديده'),

            SizedBox(height: 48),
            CustomTextBottomWithBackground(text: 'حفظ التغييرات'),
          ],
        ),
      ),
    );
  }
}

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_data_list.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_drop_down_buttom.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_up_cubit_file/sign_up_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/accepts_term_widget.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_asked_text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void dispose() {
    passwordcontroller.dispose();
    super.dispose();
  }

  late String userName, userEmail, userphone, userpassword;

  bool isAcceptCondition = false;
  String? userCity, userState;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'انشاء حساب جديد ', wantedIconBack: true),
      body: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: SingleChildScrollView(
            child: Column(
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
                  onSaved: (value) {
                    userName = value!.toLowerCase().trim();
                  },
                  validator: (value) => AppValidation.name(value),
                  textInputType: TextInputType.name,
                  labelText: 'الاسم الكامل',
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  validator: (value) => AppValidation.email(value),

                  onSaved: (value) {
                    userEmail = value!;
                  },
                  textInputType: TextInputType.emailAddress,
                  labelText: 'البريد الإلكتروني',
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  validator: (value) => AppValidation.phone(value),
                  onSaved: (value) {
                    userphone = value!.toLowerCase().trim();
                  },
                  textInputType: TextInputType.phone,
                  labelText: 'رقم الهاتف',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropDownButtom(
                        onSaved: (value) {
                          userCity = value;
                        },
                        itemsList: AppDataList.egyptGovernorates,
                        hint: 'اختر المدينة',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomDropDownButtom(
                        onSaved: (value) {
                          userState = value;
                        },
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
                        validator: (value) => AppValidation.password(value),
                        controller: passwordcontroller,
                        onSaved: (value) {
                          userpassword = value!;
                        },
                        labelText: 'كلمة المرور',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormFieldForPasswoed(
                        validator: (value) => AppValidation.confirmPassword(
                          value,
                          passwordcontroller.text,
                        ),

                        labelText: 'تأكيد كلمة المرور',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AcceptsTermWidget(
                  onChange: (value) {
                    isAcceptCondition = value;
                  },
                  conditionOnTap: () {},
                ),
                const SizedBox(height: 16),
                AbsorbPointer(
                  absorbing: widget.isLoading ? true : false,
                  child: CustomTextBottomWithBackground(
                    isLoading: widget.isLoading,
                    text: 'إنشاء حساب',
                    ontap: () async {
                      if (isAcceptCondition) {
                        if (userCity == null || userState == null) {
                          showfaulireSnackBar(
                            context,
                            message:
                                'الرجاء التاكد من اختيار المدينه و نوع الحساب ',
                          );
                        } else {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            context.read<SignUpCubit>().signUp(
                              user: UserEntity(
                                password: userpassword,
                                email: userEmail,
                                name: userName,
                                phoneNumber: userphone,
                                userType: userState!,
                                userCity: userCity!,
                              ),
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        }
                      } else {
                        showfaulireSnackBar(
                          context,
                          message: 'الرجاء الموافقه علي الشروط و الاحكام',
                        );
                      }
                    },
                  ),
                ),
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
        ),
      ),
    );
  }
}

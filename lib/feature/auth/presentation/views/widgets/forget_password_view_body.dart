import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sent_password_reset_email/sent_password_reset_email_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sent_password_reset_email/sent_password_sent_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'نسيان كلمه المرور', wantedIconBack: true),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),

                Text(
                  'لا تقلق، كل ما عليك هو كتابة البريد الإلكتروني الخاص بك.',
                  style: AppStyle.styleBold19(context),
                ),

                const SizedBox(height: 24),

                CustomTextFormFeild(
                  controller: emailController,
                  validator: (value) => AppValidation.email(value),
                  textInputType: TextInputType.emailAddress,
                  labelText: 'البريد الإلكتروني',
                ),

                const SizedBox(height: 24),

                BlocProvider(
                  create: (_) => getIt<SendPasswordResetEmailCubit>(),
                  child:
                      BlocConsumer<
                        SendPasswordResetEmailCubit,
                        SendPasswordResetEmailState
                      >(
                        listener: (context, state) {
                          if (state is SendPasswordResetEmailSuccess) {
                            showSuccessSnackBar(
                              context,
                              message:
                                  "تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.",
                            );

                            Navigator.pop(context);
                          }

                          if (state is SendPasswordResetEmailFailure) {
                            showfaulireSnackBar(
                              context,
                              message: state.message,
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomTextBottomWithBackground(
                            text: state is SendPasswordResetEmailLoading
                                ? 'جاري الإرسال...'
                                : 'إعادة تعيين كلمة المرور',
                            ontap: state is SendPasswordResetEmailLoading
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<SendPasswordResetEmailCubit>()
                                          .sendPasswordResetEmail(
                                            email: emailController.text.trim(),
                                          );
                                    } else {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                      setState(() {});
                                    }
                                  },
                          );
                        },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

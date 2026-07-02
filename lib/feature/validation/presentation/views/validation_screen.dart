import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';

import 'package:depifinalproject/feature/validation/data/model/validation_request_model.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/add_validation_request/add_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/add_validation_request/add_validation_request_state.dart';

import 'package:depifinalproject/feature/validation/presentation/views/widgets/validaion_step.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountValidationView extends StatefulWidget {
  const AccountValidationView({super.key});

  static const String routeName = 'AccountValidationView';

  @override
  State<AccountValidationView> createState() => _AccountValidationViewState();
}

class _AccountValidationViewState extends State<AccountValidationView> {
  final PageController controller = PageController();

  int currentIndex = 0;

  String? frontIdUrl;

  String? backIdUrl;

  String? selfieUrl;

  String token = getUserData().userID!;

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),

      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد الحساب")),

      body: PageView(
        controller: controller,

        physics: const NeverScrollableScrollPhysics(),

        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        children: [
          ValidationStep(
            image: Assets.imagesValidationStepone,

            title: "صورة البطاقة الشخصية الأمامية",

            description:
                "ارفع صورة واضحة للوجه الأمامي من البطاقة وتأكد أن جميع البيانات ظاهرة.",

            uploadedImage: frontIdUrl,

            onUploaded: (url) {
              setState(() {
                frontIdUrl = url;
              });

              Future.delayed(const Duration(milliseconds: 300), () {
                nextPage();
              });
            },
          ),

          ValidationStep(
            image: Assets.imagesValidtionSteptwo,

            title: "صورة البطاقة الشخصية الخلفية",

            description:
                "ارفع صورة واضحة للوجه الخلفي من البطاقة مع ظهور البيانات كاملة.",

            uploadedImage: backIdUrl,

            onUploaded: (url) {
              setState(() {
                backIdUrl = url;
              });

              Future.delayed(const Duration(milliseconds: 300), () {
                nextPage();
              });
            },
          ),

          ValidationStep(
            image: Assets.imagesValidationStrpThree,

            title: "صورة شخصية مع البطاقة",

            description:
                "التقط صورة واضحة وأنت تحمل البطاقة بحيث يظهر الوجه والبطاقة.",

            uploadedImage: selfieUrl,

            onUploaded: (url) {
              setState(() {
                selfieUrl = url;
              });
            },
          ),
        ],
      ),

      bottomNavigationBar: currentIndex == 2 && selfieUrl != null
          ? BlocProvider(
              create: (_) => getIt<AddValidationRequestCubit>(),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child:
                    BlocConsumer<
                      AddValidationRequestCubit,
                      AddValidationRequestState
                    >(
                      listener: (context, state) {
                        if (state is AddValidationRequestSuccess) {
                          showSuccessSnackBar(
                            context,

                            message: "تم إرسال طلب التحقق بنجاح",
                          );

                          Navigator.pop(context);
                        }

                        if (state is AddValidationRequestFailure) {
                          showSuccessSnackBar(context, message: state.message);
                        }
                      },

                      builder: (context, state) {
                        return CustomTextBottomWithBackground(
                          text: state is AddValidationRequestLoading
                              ? "جاري الإرسال..."
                              : "إرسال الطلب",

                          ontap: state is AddValidationRequestLoading
                              ? null
                              : () {
                                  final request = ValidationRequestModel(
                                    frontIdImage: frontIdUrl!,

                                    backIdImage: backIdUrl!,

                                    selfieImage: selfieUrl!,

                                    token: token,
                                  );

                                  context
                                      .read<AddValidationRequestCubit>()
                                      .addValidationRequest(request);
                                },
                        );
                      },
                    ),
              ),
            )
          : null,
    );
  }
}

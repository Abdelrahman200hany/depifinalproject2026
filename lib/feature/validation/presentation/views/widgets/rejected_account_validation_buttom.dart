import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/update_validation_request/update_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/update_validation_request/update_validation_request_state.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/show_rejected_dilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectedAccountValifationButtom extends StatelessWidget {
  const RejectedAccountValifationButtom({super.key, required this.request});

  final ValidationRequestEntity request;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      UpdateValidationRequestCubit,
      UpdateValidationRequestState
    >(
      listener: (context, state) {
        if (state is UpdateValidationRequestSuccess) {
          Navigator.pop(context);

          showSuccessSnackBar(context, message: "تم رفض الطلب");

          context
              .read<GetWaitingValidationRequestsCubit>()
              .getWaitingValidationRequests();
        }

        if (state is UpdateValidationRequestFailure) {
          showSuccessSnackBar(context, message: state.message);
        }
      },

      builder: (context, state) {
        return CustomTextBottomWithBackground(
          text: state is UpdateValidationRequestLoading
              ? "جاري الرفض..."
              : "رفض التفعيل",

          backgroundColor: AppColor.kRatingColor,

          ontap: state is UpdateValidationRequestLoading
              ? null
              : () {
                  showRejectReasonDialog(
                    context: context,

                    onConfirm: (reason) {
                      context
                          .read<UpdateValidationRequestCubit>()
                          .updateValidationRequest(
                            token: request.token,
                            data: {
                              "status": kValidationRejected,
                              "rejectedReason": reason,
                            },
                          );
                    },
                  );
                },
        );
      },
    );
  }
}

import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/approve_validation_request/approve_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/approve_validation_request/approve_validation_request_state.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproveValidationAccountButtom extends StatelessWidget {
  const ApproveValidationAccountButtom({super.key, required this.request});

  final ValidationRequestEntity request;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      ApproveValidationRequestCubit,
      ApproveValidationRequestState
    >(
      listener: (context, state) {
        if (state is ApproveValidationRequestSuccess) {
          showSuccessSnackBar(context, message: "تم تفعيل الحساب بنجاح");

          context
              .read<GetWaitingValidationRequestsCubit>()
              .getWaitingValidationRequests();
        }

        if (state is ApproveValidationRequestFailure) {
          showSuccessSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        return CustomTextBottomWithBackground(
          text: state is ApproveValidationRequestLoading
              ? "جاري التفعيل..."
              : "موافق على التفعيل",
          ontap: state is ApproveValidationRequestLoading
              ? null
              : () {
                  context
                      .read<ApproveValidationRequestCubit>()
                      .approveValidationRequest(token: request.token);
                },
        );
      },
    );
  }
}

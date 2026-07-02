import 'package:depifinalproject/feature/validation/presentation/manager/get_validation_request/get_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_validation_request/get_validation_request_state.dart';
import 'package:depifinalproject/feature/validation/presentation/views/valiation_wating_view.dart';
import 'package:depifinalproject/feature/validation/presentation/views/validation_approved_view.dart';
import 'package:depifinalproject/feature/validation/presentation/views/validation_rejected_view.dart';
import 'package:depifinalproject/feature/validation/presentation/views/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationConditionViewBody extends StatelessWidget {
  const ValidationConditionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetValidationRequestCubit, GetValidationRequestState>(
      builder: (context, state) {
        if (state is GetValidationRequestLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetValidationRequestSuccess) {
          final request = state.request;

          if (request.status == "validation_waiting") {
            return const ValidationWaitingView();
          } else if (request.status == "validation_approved") {
            return const ValidationApprovedView();
          } else if (request.status == "validation_rejected") {
            return ValidationRejectedView(reason: request.rejectedReason);
          }
        }


        return const AccountValidationView();
      },
    );
  }
}

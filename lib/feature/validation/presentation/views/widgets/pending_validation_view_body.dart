import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_state.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/validation_request_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingValidationViewBody extends StatelessWidget {
  const PendingValidationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "طلبات التحقق المعلقة"),

      body:
          BlocBuilder<
            GetWaitingValidationRequestsCubit,
            GetWaitingValidationRequestsState
          >(
            builder: (context, state) {
              if (state is GetWaitingValidationRequestsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetWaitingValidationRequestsFailure) {
                return Center(child: Text(state.message));
              }

              if (state is GetWaitingValidationRequestsSuccess) {
                final requests = state.requests;

                return ListView.builder(
                  padding: const EdgeInsets.all(20),

                  itemCount: requests.length,

                  itemBuilder: (context, index) {
                    return ValidationRequestItem(request: requests[index]);
                  },
                );
              }

              return const SizedBox();
            },
          ),
    );
  }
}

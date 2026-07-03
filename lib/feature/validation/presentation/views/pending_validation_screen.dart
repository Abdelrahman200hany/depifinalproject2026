import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/pending_validation_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingValidationView extends StatelessWidget {
  const PendingValidationView({super.key});

  static const String routeName = 'PendingValidationView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<GetWaitingValidationRequestsCubit>()
            ..getWaitingValidationRequests(),
      child: const PendingValidationViewBody(),
    );
  }
}

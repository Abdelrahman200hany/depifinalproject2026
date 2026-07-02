import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_validation_request/get_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/valiation_condition_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidationConditionView extends StatelessWidget {
  const ValidationConditionView({super.key});

  static const String routeName = 'ValidationConditionView';

  @override
  Widget build(BuildContext context) {
    final token = getUserData().userID!;

    return BlocProvider(
      create: (_) =>
          getIt<GetValidationRequestCubit>()..getValidationRequest(token),

      child: const ValidationConditionViewBody(),
    );
  }
}

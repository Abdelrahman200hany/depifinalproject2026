import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/approve_validation_request/approve_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/update_validation_request/update_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/approve_validation_account_buttom.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/build_validation_image.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/rejected_account_validation_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entity/validation_request_entity.dart';

class ValidationRequestItem extends StatelessWidget {
  const ValidationRequestItem({super.key, required this.request});

  final ValidationRequestEntity request;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: buildImage(context, request.frontIdImage)),
              const SizedBox(width: 8),
              Expanded(child: buildImage(context, request.backIdImage)),
              const SizedBox(width: 8),
              Expanded(child: buildImage(context, request.selfieImage)),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: BlocProvider(
                  create: (_) => getIt<ApproveValidationRequestCubit>(),
                  child: ApproveValidationAccountButtom(request: request),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: BlocProvider(
                  create: (_) => getIt<UpdateValidationRequestCubit>(),

                  child: RejectedAccountValifationButtom(request: request),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
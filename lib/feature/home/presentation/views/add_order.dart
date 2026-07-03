import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/home/domin/use_case/add_order_use_case.dart';
import 'package:depifinalproject/feature/home/domin/use_case/upload_order_image_use_case.dart';
import 'package:depifinalproject/feature/home/presentation/manger/add_new_order_cubit.dart/add_new_order_cubit.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_new_order_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});
  static const String routeName = 'AddOrderView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewOrderCubit(
        getIt.get<AddNewOrderUseCase>(),
        getIt.get<UploadOrderImageUseCase>(),
      ),
      child: const AddNewOrderBuilder(),
    );
  }
}

import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_order_cubit.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_clinet_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderClinetView extends StatelessWidget {
  const OrderClinetView({super.key});
  static const routeName = 'OrderClinetView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ClinetOrderCubit(getIt.get<GetClinetOrderUseCase>())..getAllorders(),
      child: const OrderClinetsViewBlocBuilder(),
    );
  }
}

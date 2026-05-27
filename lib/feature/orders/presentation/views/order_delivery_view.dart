import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_orders_for_delivery_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_orders_list_for_delivery/get_all_orders_list_for_delivery_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_delivery_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDeliveryView extends StatelessWidget {
  const OrderDeliveryView({super.key});
  static const routeName = 'OrderDeliveryView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllOrdersListForDeliveryCubit(
        getIt.get<GetAllOrdersForDeliveryUseCase>(),
      )..getOrdersListForDelivery(),
      child: const OrderDeliveryViewBody(),
    );
  }
}

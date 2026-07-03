import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/delete_order_by_clinet_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/clinet_order_delete_manager/clinet_order_delete_manager_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_details_view_body_for_clinet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsViewForClinet extends StatelessWidget {
  const OrderDetailsViewForClinet({super.key, required this.orderEntity});
  static const routeName = 'OrderDetailsView';
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinetOrderManagerDeleteCubit(
        getIt.get<DeleteOrderByClinetUseCase>(),
      ),
      child: OrderDetailsViewBodyforClinet(orderItem: orderEntity),
    );
  }
}

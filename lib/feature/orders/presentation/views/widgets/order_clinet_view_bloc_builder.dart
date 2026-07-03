import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_Order_state.dart';
import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_order_cubit.dart';
import 'package:depifinalproject/core/methods/get_dummy_orders.dart';
import 'package:depifinalproject/core/widgets/empty_custom_widget.dart';
import 'package:depifinalproject/core/widgets/faulire_custom_widget.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_clinet_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderClinetsViewBlocBuilder extends StatelessWidget {
  const OrderClinetsViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClinetOrderCubit, ClinetOrderState>(
      builder: (context, state) {
        if (state is ClinetOrderSuccess) {
          if (state.ordersList.isEmpty) {
            return EmptyCustomwidget(
              appBarhint: 'طلبات',
              emptyText: 'طلبات',
              hint: 'قم ب اضافة الطلبات اولا',
            );
          } else {
            return OrderClinetViewBody(orderList: state.ordersList);
          }
        } else if (state is ClinetOrderFualire) {
          return FaulireCustomwidget(
            appBarhint: 'طلبات',
            ontap: () {
              context.read<ClinetOrderCubit>().getAllorders();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: OrderClinetViewBody(orderList: GetDummyOrders.ordersList),
          );
        }
      },
    );
  }
}

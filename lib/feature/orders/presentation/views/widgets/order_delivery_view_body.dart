import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_dummy_orders.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/empty_custom_widget.dart';
import 'package:depifinalproject/core/widgets/faulire_custom_widget.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_orders_list_for_delivery/get_all_orders_list_for_delivery_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderDeliveryViewBody extends StatelessWidget {
  const OrderDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الطلبات المتاحة للتوصيل',
        wantedIconWithsectifLogic: true,
        spectifIcon: Icons.filter_list_rounded,
        spectificonlogic: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child:
            BlocBuilder<
              GetAllOrdersListForDeliveryCubit,
              GetAllOrdersListForDeliveryState
            >(
              builder: (context, state) {
                if (state is GetAllOrdersListForDeliverySuccess) {
                  if (state.orderList.isEmpty) {
                    return EmptyCustomwidget(
                      emptyText: 'لا يوجد طلبات ',
                      hint: 'الطلبات',
                      appBarhint: 'الطلبات المتاحة',
                    );
                  } else {
                    return OrderList(orderList: state.orderList);
                  }
                } else if (state is GetAllOrdersListForDeliveryFualire) {
                  return FaulireCustomwidget(appBarhint: 'حدث خطا ما');
                } else {
                  return Skeletonizer(
                    child: OrderList(orderList: GetDummyOrders.ordersList),
                  );
                }
              },
            ),
      ),
    );
  }
}

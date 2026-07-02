import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_order_cubit.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_dilog.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_buttons_bar_for_order_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_list.dart';
import 'package:depifinalproject/feature/validation/presentation/views/valiation_condition_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderClinetViewBody extends StatelessWidget {
  const OrderClinetViewBody({super.key, required this.orderList});
  final List<OrderEntity> orderList;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClinetOrderCubit>();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            getUserData().isValided == true
                ? Navigator.pushNamed(context, AddOrderView.routeName)
                : showPop(
                    onConfirm: () {
                      Navigator.pushNamed(
                        context,
                        ValidationConditionView.routeName,
                      );
                    },
                    onConfermText: 'الذهاب الي صفحه التوثيق',
                    title: 'تنبيه',
                    content: 'يجب عليك توثيق حسابك اولا',
                    context: context,
                  );

            // Navigator.pushNamed(context, AddOrderView.routeName);
          },
        ),
        appBar: CustomAppBar(title: 'طلباتي'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomButtonsBarForOrderView(),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  children: List.generate(6, (tabIndex) {
                    final filtered = cubit.getFilteredOrders(
                      tabIndex,
                      orderList,
                    );

                    return OrderList(orderList: filtered);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

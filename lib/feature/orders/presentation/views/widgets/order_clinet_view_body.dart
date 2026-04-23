import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_buttons_bar_for_order_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_list.dart';
import 'package:flutter/material.dart';

class OrderClinetViewBody extends StatelessWidget {
  const OrderClinetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, AddOrderView.routeName);
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
                  children: [OrderList(), SizedBox(), SizedBox()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

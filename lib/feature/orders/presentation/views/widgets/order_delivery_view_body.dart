import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_filter_icon.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_list.dart';
import 'package:flutter/material.dart';

class OrderDeliveryViewBody extends StatelessWidget {
  const OrderDeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الطلبات المتاحة للتوصيل'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: Column(
          children: [
            FiltterIcon(),
            SizedBox(height: 16),
            Expanded(child: OrderList()),
          ],
        ),
      ),
    );
  }
}

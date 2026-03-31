import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) =>
          Padding(padding: EdgeInsets.only(bottom: 12), child: OrderItem()),
    );
  }
}

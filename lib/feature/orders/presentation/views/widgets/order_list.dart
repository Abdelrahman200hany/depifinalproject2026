import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orderList});
  final List<OrderEntity> orderList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: OrderItem(orderIteml: orderList[index]),
      ),
    );
  }
}

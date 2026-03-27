import 'package:depifinalproject/core/widgets/custom_divider.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_body.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_header.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_price.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          OrderItemHeader(),
          CustomDivider(),
          OrderItemBody(),
          CustomDivider(),
          Row(
            children: [
              Expanded(child: OrderItemPrice()),
              SizedBox(width: 14),
              Expanded(child: OrderItemPrice()),
            ],
          ),
          CustomDivider(),
          CustomTextBottomWithBackground(text: 'عرض التفاصيل'),
        ],
      ),
    );
  }
}


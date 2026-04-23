import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_divider.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_details_view_for_clinet.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_details_view_for_delivery.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_body.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_header.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_price.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .6,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.kPrimaryColor.withValues(alpha: 0.01),
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withValues(alpha: 0.4)),
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
            CustomTextBottomWithBackground(
              text: 'عرض التفاصيل',
              ontap: () {
                Navigator.pushNamed(
                  context,
                  getUserData().userType == kClinet
                      ? OrderDetailsViewForClinet.routeName
                      : OrderDetailsViewForDelivery.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

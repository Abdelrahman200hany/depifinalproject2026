import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/cut_srting.dart';
import 'package:depifinalproject/core/utils/app_color.dart' show AppColor;
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/cancel_order_status.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/info_item.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/status_cart_item.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/up_data_status_on_way_to_clinet.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/updata_status_order_complete.dart';
import 'package:flutter/material.dart';

class ShipmentDetailsScreen extends StatelessWidget {
  const ShipmentDetailsScreen({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#Fl-${cutString(order.uIdOrder, maxLength: 12)}",
                  style: AppStyle.styleSRegular16(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  "شحنة  ${order.parcelType} - ${order.pickupGovernorate}",
                  style: AppStyle.styleSRegular13(context),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200, width: 3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                order.orderStatus,
                style: AppStyle.styleSRegular16(context),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Sender & Phone
        Row(
          children: [
            Expanded(
              child: InfoItem(
                title: "المرسل",
                value: order.senderName,
                icon: Icons.person_outline,
              ),
            ),
            // Container(width:2 , height: 60, color: Colors.grey.shade300),
            // SizedBox(width: 8),
            Expanded(
              child: InfoItem(
                title: "رقم التواصل",
                value: order.senderPhone,
                icon: Icons.phone_outlined,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Address
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("عنوان التوصيل", style: AppStyle.styleSRegular16(context)),

                const SizedBox(width: 8),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue.shade700,
                  size: 24,
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              "${order.recipientGovernorate} - ${order.recipientAddress} - ${order.recipientMark}",
              textAlign: TextAlign.center,
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: Colors.black),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "رسوم التوصيل المستحقة",
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: Colors.black54),
            ),
            Text(
              "${order.deliveryPrice} جنية",
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: AppColor.kPrimaryColor),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Actions
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.3,
          children: [
            StatusCarditem(
              isActive: order.orderStatus == kstatusWaiting,
              title: "جاري استلام الطرد",
              icon: Icons.inventory_2_outlined,
              color: Colors.blue.shade50,
              iconColor: Colors.blue,
            ),

            UpdataStatusToOnWaytoClinet(order: order),
            UpdataStatusorderComplete(order: order),

            CancelorderStatus(order: order),
          ],
        ),
      ],
    );
  }
}

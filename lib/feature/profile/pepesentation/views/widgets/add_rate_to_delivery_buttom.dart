import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/add_rete_view_for_delivery.dart';
import 'package:flutter/material.dart';

class AddRatetoDeliveryButtom extends StatelessWidget {
  const AddRatetoDeliveryButtom({super.key, required this.orderIteml});

  final OrderEntity orderIteml;

  @override
  Widget build(BuildContext context) {
    return CustomTextBottomWithBackground(
      backgroundColor: orderIteml.deliverReviwed == false
          ? Colors.green
          : AppColor.kGreyAppColor,
      text: orderIteml.deliverReviwed == false
          ? 'تقيم المندوب'
          : 'تم تقيم المندوب',
      ontap: orderIteml.deliverReviwed == false
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddRateViewFordelivery(
                    orderID: orderIteml.uIdOrder,
                    user: getUserData(),
                    targetUserId: orderIteml.deliveryId,
                  ),
                ),
              );
            }
          : () {
              showfaulireSnackBar(
                context,
                message: 'لا يمكن تقيم المندوب مره اخري',
              );
            },
    );
  }
}

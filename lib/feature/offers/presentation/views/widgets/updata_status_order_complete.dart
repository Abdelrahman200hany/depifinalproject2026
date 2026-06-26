import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_can_not_change_status_dilog.dart';
import 'package:depifinalproject/core/methods/show_complete_order_input_dilog.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/status_cart_item.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_simple_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdataStatusorderComplete extends StatelessWidget {
  const UpdataStatusorderComplete({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateSimpleOrderCubit(getIt.get<UpdateSimpleOrderDataUseCase>()),

      child: BlocConsumer<UpdateSimpleOrderCubit, UpdateSimpleOrderState>(
        listener: (context, state) {
          if (state is UpdateSimpleOrderSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainView.routeName,
              (route) => false,
            );

            showSuccessSnackBar(context, message: "تم إغلاق الطلب بنجاح");
          }

          if (state is UpdateSimpleOrderFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          return StatusCarditem(
            onTap: () {
              if (order.orderStatus != kstatusOnWay) {
                showCannotChangeStatusDialog(context: context);
              } else {
                showCompleteOrderAppTextInputDialog(
                  context: context,

                  title: "كود إغلاق الطلب",

                  hintText: "استلم الكود من العميل",

                  codeDelivery: order.deliveryCode,

                  onConfirm: (value) {
                    context
                        .read<UpdateSimpleOrderCubit>()
                        .updateSimpleOrderData(
                          orderId: order.uIdOrder,

                          data: {'orderStatus': kstatusDelivered},
                        );
                  },
                );
              }
            },

            isActive: order.orderStatus == kstatusDelivered,

            title: "تم التوصيل",

            icon: Icons.check_circle_outline,

            color: Colors.grey.shade300,
          );
        },
      ),
    );
  }
}
// import 'package:depifinalproject/core/consts/consts.dart';
// import 'package:depifinalproject/core/methods/show_can_not_change_status_dilog.dart';
// import 'package:depifinalproject/core/methods/show_input_dilog.dart';
// import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
// import 'package:depifinalproject/feature/offers/presentation/views/widgets/status_cart_item.dart';
// import 'package:flutter/material.dart';

// class UpdataStatusorderComplete extends StatelessWidget {
//   const UpdataStatusorderComplete({
//     super.key,
//     required this.order,
//   });

//   final OrderEntity order;

//   @override
//   Widget build(BuildContext context) {
//     return StatusCarditem(
//       onTap: () {
//         if (order.orderStatus != kstatusOnWay) {
//           showCannotChangeStatusDialog(context: context);
//         } else {
//           showAppTextInputDialog(
//             onConfirm: (value) {},
//             context: context,
//             hintText: 'استلم الكود من العميل',
//             title: 'كود اغلاق الطلب',
//             codeDelivery: order.deliveryCode,
//           );
//         }
//       },
//       isActive: order.orderStatus == kstatusDelivered,
//       title: "تم التوصيل",
//       icon: Icons.check_circle_outline,
//       color: Colors.grey.shade300,
//     );
//   }
// }

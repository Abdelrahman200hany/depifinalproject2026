import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_can_not_change_status_dilog.dart';
import 'package:depifinalproject/core/methods/show_cancel_order_app_text_Input_dialog.dart';
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

class CancelorderStatus extends StatelessWidget {
  const CancelorderStatus({super.key, required this.order});

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

            showSuccessSnackBar(context, message: "تم إلغاء الطلب بنجاح");
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
              if (order.orderStatus == kstatusDelivered) {
                showCannotChangeStatusDialog(context: context);
              } else {
                showCancelOrderAppTextInputDialog(
                  context: context,

                  maxLine: 3,

                  title: "إلغاء الطلب",

                  hintText: "اكتب سبب إلغاء الطلب",

                  onConfirm: (value) {
                    context
                        .read<UpdateSimpleOrderCubit>()
                        .updateSimpleOrderData(
                          orderId: order.uIdOrder,

                          data: {
                            'orderStatus': kstatusReturned,

                            'rejectedReason': value,
                          },
                        );
                  },
                );
              }
            },

            title: "إلغاء طلب",

            icon: Icons.close,

            color: Colors.red.shade50,

            isActive: order.orderStatus == kstatusReturned,
          );
        },
      ),
    );
  }
}

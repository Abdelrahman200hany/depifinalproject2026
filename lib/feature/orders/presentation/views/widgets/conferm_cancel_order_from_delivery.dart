import 'package:depifinalproject/core/methods/show_dilog.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_simple_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfermCancelButtomfromDeliveryRequest extends StatelessWidget {
  const ConfermCancelButtomfromDeliveryRequest({
    super.key,
    required this.orderIteml,
  });

  final OrderEntity orderIteml;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateSimpleOrderCubit(getIt.get<UpdateSimpleOrderDataUseCase>()),

      child: BlocConsumer<UpdateSimpleOrderCubit, UpdateSimpleOrderState>(
        listener: (context, state) {
          if (state is UpdateSimpleOrderSuccess) {
            showSuccessSnackBar(
              context,
              message: 'تم تاكيد الغاء الطلب و استلام المرتجع',
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainView.routeName,
              (route) => false,
            );
          }
          if (state is UpdateSimpleOrderFailure) {
            showfaulireSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          return CustomTextBottomWithBackground(
            isLoading: state is UpdateSimpleOrderLoading ? true : false,
            backgroundColor: orderIteml.cancelOrderConferm == false
                ? Colors.red
                : AppColor.kGreyAppColor,
            text: orderIteml.cancelOrderConferm == false
                ? 'سبب إلغاء'
                : 'تم استلام المرتجع',
            ontap: orderIteml.cancelOrderConferm == false
                ? () {
                    showPop(
                      context: context,
                      title: 'سبب إلغاء',
                      content: orderIteml.rejectedReason,
                      onConfermText: 'تاكيد استلام المرتجع',
                      onConfirm: () {
                        context
                            .read<UpdateSimpleOrderCubit>()
                            .updateSimpleOrderData(
                              orderId: orderIteml.uIdOrder,
                              data: {'cancelOrderConferm': true},
                            );

                        Navigator.pop(context);
                      },
                    );
                  }
                : () {
                    showfaulireSnackBar(
                      context,
                      message: 'تم استلام المرتجع بالفعل ',
                    );
                  },
          );
        },
      ),
    );
  }
}

import 'package:depifinalproject/core/methods/show_dilog.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/clinet_order_delete_manager/clinet_order_delete_manager_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDeleteOrderButtomByClinet extends StatelessWidget {
  const CustomDeleteOrderButtomByClinet({
    super.key,
    required this.orderItemUId,
  });

  final String orderItemUId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      ClinetOrderManagerDeleteCubit,
      ClinetOrderManagerDeleteState
    >(
      listener: (context, state) {
        if (state is ClinetOrderManagerDeleteFaulire) {
          showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is ClinetOrderManagerDeleteSuccess) {
          showSuccessSnackBar(context, message: 'لقد تم حدف المنتج بنجاح');
        }
      },
      builder: (context, state) {
        return CustomTextBottomWithBackground(
          isLoading: state is ClinetOrderManagerDeleteLoading ? true : false,
          text: 'الغاء الطلب',
          ontap: () {
            showPop(
              content: 'هل انت متكد من انك تريد الغاء الطلب ',
              context: context,
              title: 'الغاء طلب ',
              onConfirm: () async {
                await context.read<ClinetOrderManagerDeleteCubit>().deleteOrder(
                  orderId: orderItemUId,
                );
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainView.routeName,
                  (route) => false,
                );
              },
            );
          },
          backgroundColor: Colors.redAccent,
        );
      },
    );
  }
}

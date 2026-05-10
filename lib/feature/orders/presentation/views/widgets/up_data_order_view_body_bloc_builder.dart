import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/clinet_order_up_data_manager/clinet_order_up_date_manager_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/update_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderViewBodyBlocBuilder extends StatelessWidget {
  const UpdateOrderViewBodyBlocBuilder({super.key, required this.orderitem});

  final OrderEntity orderitem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      ClinetOrderUpDateManagerCubit,
      ClinetOrderUpDateManagerState
    >(
      listener: (context, state) {
        if (state is ClinetOrderUpDateManagerFaulire) {
          showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is ClinetOrderUpDateManagerSuccess) {
          showSuccessSnackBar(context, message: 'تم التحديث ب نجاح');
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainView.routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return UpdateOrderViewBody(
          order: orderitem,
          isLoading: state is ClinetOrderUpDateManagerLoading ? true : false,
        );
      },
    );
  }
}

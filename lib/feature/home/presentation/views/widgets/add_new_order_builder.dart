import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/feature/home/presentation/manger/add_new_order_cubit.dart/add_new_order_cubit.dart';
import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/add_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddNewOrderBuilder extends StatelessWidget {
  const AddNewOrderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewOrderCubit, AddNewOrderState>(
      listener: (context, state) {
        if (state is AddNewOrderFailure) {
          showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is AddNewOrderSuccess) {
          showSuccessSnackBar(context, message: 'تم اضافهه  المنتج ب نجاح');
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is AddNewOrderLoading ? true : false,

          child: AddOrderViewBody(
            isLoading: state is AddNewOrderLoading ? true : false,
          ),
        );
      },
    );
  }
}

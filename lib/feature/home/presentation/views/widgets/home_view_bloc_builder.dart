import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/referch_user_data/refresh_user_data_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/referch_user_data/refresh_user_data_state.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/home_view_body_for_delivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBlocBuilder extends StatelessWidget {
  const HomeViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshUserDataCubit, RefreshUserDataState>(
      builder: (context, state) {
        if (state is RefreshUserDataLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is RefreshUserDataFailure) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        return getUserData().userType == kClinet
            ? HomeViewBody()
            : HomeViewBodyForDelivery();
      },
    );
  }
}

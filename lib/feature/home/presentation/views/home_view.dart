import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/referch_user_data/refresh_user_data_cubit.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/home_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<RefreshUserDataCubit>()
            ..refreshUserData(userId: getUserData().userID!),
      child: HomeViewBlocBuilder(),
    );
  }
}

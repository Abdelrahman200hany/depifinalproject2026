import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/up_date_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdataProfileView extends StatelessWidget {
  const UpdataProfileView({super.key});
  static const String routeName = 'UpdataProfileView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<UpdateUserCubit>(),
      child: UpDateProfileViewBody(),
    );
  }
}

import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_up_cubit_file/sign_up_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/sign_up_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SugnUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
      child:  
      const SignUpBlocBuilder(),
    );
  }
}

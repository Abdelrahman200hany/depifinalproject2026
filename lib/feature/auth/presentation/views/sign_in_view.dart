import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_in_cubit_file/sign_in_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/sign_in_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'SignInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: const SignInBlocBuilder(),
    );
  }
}

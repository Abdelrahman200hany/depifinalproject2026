import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_up_cubit_file/sign_up_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocBuilder extends StatelessWidget {
  const SignUpBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFaulire) {
          showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is SignUpSuccess) {
          showSuccessSnackBar(
            context,
            message: 'مبروك تم انشاء الحساب الرجاء التوجه الي البريد للتفعيل ',
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SignUpViewBody(isLoading: state is SignUpLoading ? true : false);
      },
    );
  }
}

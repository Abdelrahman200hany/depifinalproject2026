import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sign_in_cubit_file/sign_in_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBlocBuilder extends StatelessWidget {
  const SignInBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInfaulire) {
          return showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
          return showSuccessSnackBar(context, message: 'مرحبا بك في فلاش');
        }
      },
      builder: (context, state) {
        return SignInViewBody(isLoading: state is SignInloading ? true : false);
      },
    );
  }
}

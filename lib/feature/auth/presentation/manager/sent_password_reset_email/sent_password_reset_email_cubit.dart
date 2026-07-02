import 'package:depifinalproject/feature/auth/domain/use_casse/send_password_reset_email_use_case.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sent_password_reset_email/sent_password_sent_email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendPasswordResetEmailCubit extends Cubit<SendPasswordResetEmailState> {
  final SendPasswordResetEmailUseCase useCase;

  SendPasswordResetEmailCubit(this.useCase)
    : super(SendPasswordResetEmailInitial());

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(SendPasswordResetEmailLoading());

    final result = await useCase(email: email);

    result.fold(
      (failure) => emit(SendPasswordResetEmailFailure(failure.message)),
      (_) => emit(SendPasswordResetEmailSuccess()),
    );
  }
}

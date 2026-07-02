abstract class SendPasswordResetEmailState {}

class SendPasswordResetEmailInitial extends SendPasswordResetEmailState {}

class SendPasswordResetEmailLoading extends SendPasswordResetEmailState {}

class SendPasswordResetEmailSuccess extends SendPasswordResetEmailState {}

class SendPasswordResetEmailFailure extends SendPasswordResetEmailState {
  final String message;

  SendPasswordResetEmailFailure(this.message);
}

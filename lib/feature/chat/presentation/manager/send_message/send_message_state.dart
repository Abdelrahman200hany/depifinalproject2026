abstract class SendMessageState {}

class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {}

class SendMessageSuccess extends SendMessageState {}

class SendMessageFailure extends SendMessageState {
  final String message;

  SendMessageFailure(this.message);
}
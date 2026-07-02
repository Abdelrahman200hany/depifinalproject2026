abstract class MarkMessagesAsReadState {}

class MarkMessagesAsReadInitial extends MarkMessagesAsReadState {}

class MarkMessagesAsReadLoading extends MarkMessagesAsReadState {}

class MarkMessagesAsReadSuccess extends MarkMessagesAsReadState {}

class MarkMessagesAsReadFailure extends MarkMessagesAsReadState {
  final String message;

  MarkMessagesAsReadFailure(this.message);
}
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';

abstract class GetMessagesState {}

class GetMessagesInitial extends GetMessagesState {}

class GetMessagesLoading extends GetMessagesState {}

class GetMessagesSuccess extends GetMessagesState {
  final List<MessageEntity> messages;

  GetMessagesSuccess(this.messages);
}

class GetMessagesFailure extends GetMessagesState {
  final String message;

  GetMessagesFailure(this.message);
}

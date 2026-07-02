import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';

abstract class GetOrCreateChatState {}

class GetOrCreateChatInitial extends GetOrCreateChatState {}

class GetOrCreateChatLoading extends GetOrCreateChatState {}

class GetOrCreateChatSuccess extends GetOrCreateChatState {
  final ChatEntity chat;

  GetOrCreateChatSuccess(this.chat);
}

class GetOrCreateChatFailure extends GetOrCreateChatState {
  final String message;

  GetOrCreateChatFailure(this.message);
}
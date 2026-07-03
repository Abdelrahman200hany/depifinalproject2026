import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';

abstract class GetUserChatsState {}

class GetUserChatsInitial extends GetUserChatsState {}

class GetUserChatsLoading extends GetUserChatsState {}

class GetUserChatsSuccess extends GetUserChatsState {
  final List<ChatEntity> chats;

  GetUserChatsSuccess(this.chats);
}

class GetUserChatsFailure extends GetUserChatsState {
  final String message;

  GetUserChatsFailure(this.message);
}

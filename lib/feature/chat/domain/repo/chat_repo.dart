import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

abstract class ChatRepo {
  Future<Either<Failure, ChatEntity>> getOrCreateChat({
    required OrderEntity order,
  });

  /// لازم Stream
  Stream<Either<Failure, List<ChatEntity>>> getUserChats({
    required String userId,
  });

  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required MessageEntity message,
  });

  /// لازم Stream
  Stream<Either<Failure, List<MessageEntity>>> getMessages({
    required String chatId,
  });

  Future<Either<Failure, void>> markMessagesAsRead({
    required String chatId,
    required bool isClient,
  });
}

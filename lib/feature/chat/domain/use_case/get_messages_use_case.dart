import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';

class GetMessagesUseCase {
  final ChatRepo repo;

  GetMessagesUseCase(this.repo);

  Stream<Either<Failure, List<MessageEntity>>> execute({
    required String chatId,
  }) {
    return repo.getMessages(chatId: chatId);
  }
}
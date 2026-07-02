import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepo repo;

  SendMessageUseCase(this.repo);

  Future<Either<Failure, void>> execute({
    required String chatId,
    required MessageEntity message,
  }) {
    return repo.sendMessage(
      chatId: chatId,
      message: message,
    );
  }
}
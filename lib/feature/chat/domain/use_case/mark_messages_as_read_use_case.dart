import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';

class MarkMessagesAsReadUseCase {
  final ChatRepo repo;

  MarkMessagesAsReadUseCase(this.repo);

  Future<Either<Failure, void>> execute({
    required String chatId,
    required bool isClient,
  }) {
    return repo.markMessagesAsRead(
      chatId: chatId,
      isClient: isClient,
    );
  }
}
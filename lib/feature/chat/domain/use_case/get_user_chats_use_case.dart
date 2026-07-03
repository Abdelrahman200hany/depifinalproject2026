import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';

class GetUserChatsUseCase {
  final ChatRepo repo;

  GetUserChatsUseCase(this.repo);

  Stream<Either<Failure, List<ChatEntity>>> execute({
    required String userId,
  }) {
    return repo.getUserChats(userId: userId);
  }
}
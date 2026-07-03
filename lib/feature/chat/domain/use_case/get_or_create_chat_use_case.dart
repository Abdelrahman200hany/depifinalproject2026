import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/repo/chat_repo.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class GetOrCreateChatUseCase {
  final ChatRepo repo;

  GetOrCreateChatUseCase(this.repo);

  Future<Either<Failure, ChatEntity>> execute({required OrderEntity order}) {
    return repo.getOrCreateChat(order: order);
  }
}

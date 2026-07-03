import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/domain/repo/rate_repo.dart';

class AddRateUseCase {
  final RateRepo rateRepo;

  AddRateUseCase(this.rateRepo);

  Future<Either<Failure, void>> execute({
    required String targetUserId,

    required RateEntity rate,
  }) async {
    return await rateRepo.addRate(targetUserId: targetUserId, rate: rate);
  }
}

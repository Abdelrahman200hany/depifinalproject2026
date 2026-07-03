import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/domain/repo/rate_repo.dart';

class GetRatesUseCase {
  final RateRepo rateRepo;

  GetRatesUseCase(this.rateRepo);

  Future<Either<Failure, List<RateEntity>>> execute({
    required String targetUserId,
  }) async {
    return await rateRepo.getRates(targetUserId: targetUserId);
  }
}

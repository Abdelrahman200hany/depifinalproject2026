import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';

abstract class RateRepo {
  Future<Either<Failure, void>> addRate({
    required String targetUserId,

    required RateEntity rate,
  });

  Future<Either<Failure, List<RateEntity>>> getRates({
    required String targetUserId,
  });
}

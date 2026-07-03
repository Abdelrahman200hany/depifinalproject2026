import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
import 'package:depifinalproject/feature/profile/data/model/rate_model.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/domain/repo/rate_repo.dart';

class RateRepoImpl implements RateRepo {
  final DataBaseServies dataBaseServies;

  RateRepoImpl(this.dataBaseServies);

  @override
  Future<Either<Failure, void>> addRate({
    required String targetUserId,

    required RateEntity rate,
  }) async {
    try {
      await dataBaseServies.addSubCollectionData(
        path: AppBackendEndpoints.readUserCollention,

        docId: targetUserId,

        subCollection: AppBackendEndpoints.userRates,

        data: RateModel.fromEntity(rate).toJson(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: 'فشل في إضافة التقييم والسبب هو $e'));
    }
  }

  @override
  Future<Either<Failure, List<RateEntity>>> getRates({
    required String targetUserId,
  }) async {
    try {
      final data = await dataBaseServies.readSubCollection(
        path: AppBackendEndpoints.readUserCollention,

        docId: targetUserId,

        subCollection: AppBackendEndpoints.userRates,
      );

      final rates = (data as List).map((e) {
        return RateModel.fromJson(e).toEntity();
      }).toList();

      return right(rates);
    } catch (e) {
      return left(ServerFailure(message: 'فشل في جلب التقييمات  والسبب هو $e'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';

import 'package:depifinalproject/feature/validation/data/model/validation_request_model.dart';
import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';

class ValidationRequestRepoImpl implements ValidationRequestRepo {
  final DataBaseServies dataBaseServies;

  ValidationRequestRepoImpl(this.dataBaseServies);

  @override
  Future<Either<Failure, void>> addValidationRequest(
    ValidationRequestEntity request,
  ) async {
    try {
      final model = ValidationRequestModel.fromEntity(request);

      await dataBaseServies.addData(
        path: AppBackendEndpoints.validationrequest,

        documentID: request.token,

        data: model.toJson(),
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(message: 'فشل في إضافة طلب التحقق والسبب هو $e'),
      );
    }
  }

  @override
  Future<Either<Failure, ValidationRequestEntity>> getValidationRequest(
    String token,
  ) async {
    try {
      final data = await dataBaseServies.readData(
        path: AppBackendEndpoints.validationrequest,

        documentID: token,
      );

      return right(ValidationRequestModel.fromJson(data));
    } catch (e) {
      return left(ServerFailure(message: 'فشل في جلب طلب التحقق والسبب هو $e'));
    }
  }

  @override
  Future<Either<Failure, List<ValidationRequestEntity>>>
  getWaitingValidationRequests() async {
    try {
      final data = await dataBaseServies.readSpecificData(
        path: AppBackendEndpoints.validationrequest,

        query: {"status": kValidationWaiting},
      );

      final result = (data as List)
          .map((e) => ValidationRequestModel.fromJson(e))
          .toList();

      return right(result);
    } catch (e) {
      return left(
        ServerFailure(message: 'فشل في جلب طلبات التحقق والسبب هو $e'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateValidationRequest({
    required String token,

    required Map<String, dynamic> data,
  }) async {
    try {
      await dataBaseServies.upDatadata(
        path: AppBackendEndpoints.validationrequest,

        dataId: token,

        data: data,
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(message: 'فشل في تحديث طلب التحقق والسبب هو $e'),
      );
    }
  }
}

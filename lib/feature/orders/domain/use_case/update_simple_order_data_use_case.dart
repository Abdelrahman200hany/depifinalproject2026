import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class UpdateSimpleOrderDataUseCase {
  final OrderRepo repository;

  UpdateSimpleOrderDataUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String orderId,
    required Map<String, dynamic> data,
  }) {
    return repository.updateSimpleOrderData(orderId: orderId, data: data);
  }
}

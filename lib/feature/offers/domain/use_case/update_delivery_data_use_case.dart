import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class UpdateDeliveryDataUseCase {
  final OrderRepo orderRepo;

  UpdateDeliveryDataUseCase(this.orderRepo);

  Future<Either<Failure, void>> excute({
    required String orderId,
    required String offerId,
    required Map<String, dynamic> data,
  }) async {
    return await orderRepo.updateDeliveryData(
      orderId: orderId,
      offerId: offerId,
      data: data,
    );
  }
}
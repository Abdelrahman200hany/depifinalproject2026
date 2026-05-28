import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class UpDataOrderDataUseCase  {
  final OrderRepo orderRepo;

  UpDataOrderDataUseCase (this.orderRepo);

  Future<Either<Failure, void>> excute({
    required String orderId,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
  }) async {
    return await orderRepo.updateOrderData(
      orderId: orderId,
      newUpDatedOrder: newUpDatedOrder,
      oldOrder: oldOrder,
    );
  }
}

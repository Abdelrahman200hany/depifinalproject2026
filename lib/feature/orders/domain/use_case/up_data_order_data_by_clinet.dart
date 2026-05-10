import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class UpDataOrderDataByClinet {
  final OrderRepo orderRepo;

  UpDataOrderDataByClinet(this.orderRepo);

  Future<Either<Failure, void>> excute({
    required String orderId,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
  }) async {
    return await orderRepo.updateOrderByClinet(
      orderId: orderId,
      newUpDatedOrder: newUpDatedOrder,
      oldOrder: oldOrder,
    );
  }
}

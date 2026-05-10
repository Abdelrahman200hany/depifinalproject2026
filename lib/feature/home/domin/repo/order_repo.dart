import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getAllOrdersforDelivery();
  Future<Either<Failure, List<OrderEntity>>> getAllMyOrdersforClient();
  Future<Either<Failure, List<OrderEntity>>> getAllMyAccetsOrderforDelivery();
  Future<Either<Failure, void>> addNewOrders({required OrderEntity order});
  Future<Either<Failure, void>> deleteOrderByClinet({required String orderId});
  Future<Either<Failure, void>> updateOrderByClinet({
    required String orderId,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
  });
}

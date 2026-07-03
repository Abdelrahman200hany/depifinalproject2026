import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getAllOrdersforDelivery();
  Future<Either<Failure, List<OrderEntity>>> getAllMyOrdersforClient({
    Map<String, dynamic>? query,
  });
  Future<Either<Failure, List<OrderEntity>>> getAllMyAccetsOrderforDelivery();
  Future<Either<Failure, void>> addNewOrders({required OrderEntity order});
  Future<Either<Failure, void>> deleteOrderByClinet({required String orderId});
  Future<Either<Failure, void>> updateOrderData({
    required String orderId,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
  });
  Future<Either<Failure, void>> updateSimpleOrderData({
    required String orderId,

    required Map<String, dynamic> data,
  });
  Future<Either<Failure, void>> addDeliveryOffer({
    required String orderID,
    required double proposedPrice,
  });
  Future<Either<Failure, List<DeliveryEntity>>> getAllOffersRelatedToOrder({
    Map<String, dynamic>? query,
    required String orderid,
  });
  Future<Either<Failure, void>> updateDeliveryData({
    required String orderId,
    required String offerId,
    required Map<String, dynamic> data,
  });
}

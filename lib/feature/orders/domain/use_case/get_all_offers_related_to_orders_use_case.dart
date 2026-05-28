import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class GetAllOffersRelatedToOrderUseCase {
  final OrderRepo orderRepo;

  GetAllOffersRelatedToOrderUseCase(this.orderRepo);

  Future<Either<Failure, List<DeliveryEntity>>> excute({
    required String orderid,
    Map<String, dynamic>? query,
  }) async {
    return await orderRepo.getAllOffersRelatedToOrder(
      orderid: orderid,
      query: {'offerStatus': kstatusofferpending},
    );
  }
}

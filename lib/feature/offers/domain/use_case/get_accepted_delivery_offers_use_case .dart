import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class GetAcceptedDeliveryOffersUseCase {
  final OrderRepo ordersRepo;

  GetAcceptedDeliveryOffersUseCase(this.ordersRepo);

  Future<Either<Failure, List<OrderEntity>>> execute() async {
    return await ordersRepo.getAllMyAccetsOrderforDelivery();
  }
}

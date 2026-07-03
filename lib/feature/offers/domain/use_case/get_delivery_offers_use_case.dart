import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class GetDeliveryOffersUseCase{
  final OrderRepo orderRepo;

  GetDeliveryOffersUseCase(this.orderRepo);

  Future<Either<Failure, List<OrderEntity>>> excute() async {
    return await orderRepo.getAllOrdersforDelivery();
  }
}

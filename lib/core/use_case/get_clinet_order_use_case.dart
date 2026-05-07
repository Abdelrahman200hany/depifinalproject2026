import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class GetClinetOrderUseCase {
  final OrderRepo orderRepo;

  GetClinetOrderUseCase(this.orderRepo);

  Future<Either<Failure, List<OrderEntity>>> excute() async {
    return await orderRepo.getAllMyOrdersforClient();
  }
}

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class AddNewOrderUseCase {
  final OrderRepo orderRepo;

  AddNewOrderUseCase(this.orderRepo);

  Future<Either<Failure, void>> excute({required OrderEntity order}) async {
    return await orderRepo.addNewOrders(order: order);
  }
}

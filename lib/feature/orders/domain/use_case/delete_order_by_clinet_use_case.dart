import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class DeleteOrderByClinetUseCase {
  final OrderRepo orderRepo;

  DeleteOrderByClinetUseCase(this.orderRepo);

  Future<Either<Failure, void>> excute({required String orderId}) async {
    return await orderRepo.deleteOrderByClinet(orderId: orderId);
  }
}

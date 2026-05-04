import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class OrderUseCase {
  final OrderRepo orderRepo;

  OrderUseCase(this.orderRepo);



 Future <Either<Failure , List<OrderEntity>>> getAllorders () async{

  return await orderRepo.getAllOrders();
 }
}

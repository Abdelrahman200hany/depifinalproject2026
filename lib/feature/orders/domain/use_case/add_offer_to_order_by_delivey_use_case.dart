import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';

class AddDeliveryOfferUseCase {
  final OrderRepo orderRepo;

  AddDeliveryOfferUseCase(this.orderRepo);

  Future<Either<Failure, void>> excute({
    required String orderID,
    required double proposedPrice,
  }) async {
    return await orderRepo.addDeliveryOffer(
      orderID: orderID,
      proposedPrice: proposedPrice,
    );
  }
}
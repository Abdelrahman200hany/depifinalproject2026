import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/update_delivery_data_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/up_data_order_data_use_case.dart';

class AcceptDeliveryOfferUseCase {
  final UpDataOrderDataUseCase upDataOrderDataUseCase;

  final UpdateDeliveryDataUseCase updateDeliveryDataUseCase;

  AcceptDeliveryOfferUseCase(
    this.upDataOrderDataUseCase,
    this.updateDeliveryDataUseCase,
  );

  Future<Either<Failure, void>> excute({
    required String orderId,
    required String offerId,
    required String deliveryName,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
    double? deliveryPrice,
  }) async {
    /// update order data first
    final orderResult = await upDataOrderDataUseCase.excute(
      orderId: orderId,
      newUpDatedOrder: newUpDatedOrder.copyWith(
        deliveryName: deliveryName,
        orderStatus: kstatusWaiting,
        deliveryPrice: deliveryPrice,
      ),
      oldOrder: oldOrder,
    );

    return await orderResult.fold(
      (failure) async {
        return left(failure);
      },
      (_) async {
        /// if order updated successfully
        /// update delivery offer

        final deliveryResult = await updateDeliveryDataUseCase.excute(
          orderId: orderId,
          offerId: offerId,
          data: {'offerStatus': kstatusofferAccepted},
        );

        return deliveryResult.fold(
          (failure) => left(failure),
          (_) => right(null),
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/accept_delivery_offer_use_case.dart';
import 'package:meta/meta.dart';

part 'accept_delivery_offer_state.dart';

class AcceptDeliveryOfferCubit extends Cubit<AcceptDeliveryOfferState> {
  AcceptDeliveryOfferCubit(this.acceptDeliveryOfferUseCase)
    : super(AcceptDeliveryOfferInitial());

  final AcceptDeliveryOfferUseCase acceptDeliveryOfferUseCase;

  Future<void> acceptDeliveryOffer({
    required String orderId,
    required String offerId,
    required String deliveryName,
    required String deliveryId,
    required String  deliveryPhone,
    required OrderEntity newUpDatedOrder,
    required OrderEntity oldOrder,
    double? deliveryPrice,
  }) async {
    emit(AcceptDeliveryOfferLoading());

    final result = await acceptDeliveryOfferUseCase.excute(
      deliveryPhone: deliveryPhone,
      deliveryId: deliveryId,
      orderId: orderId,
      offerId: offerId,
      deliveryName: deliveryName,
      newUpDatedOrder: newUpDatedOrder,
      oldOrder: oldOrder,
      deliveryPrice: deliveryPrice,
    );

    result.fold(
      (failure) {
        emit(AcceptDeliveryOfferFailure(errorMessage: failure.message));
      },
      (_) {
        emit(AcceptDeliveryOfferSuccess());
      },
    );
  }
}

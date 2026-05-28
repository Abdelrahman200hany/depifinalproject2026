import 'package:bloc/bloc.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/update_delivery_data_use_case.dart';
import 'package:meta/meta.dart';

part 'reject_delivery_offer_state.dart';

class RejectDeliveryOfferCubit extends Cubit<RejectDeliveryOfferState> {
  RejectDeliveryOfferCubit(this.updateDeliveryDataUseCase)
    : super(RejectDeliveryOfferInitial());

  final UpdateDeliveryDataUseCase updateDeliveryDataUseCase;

  Future<void> rejectDeliveryOffer({
    required String orderId,
    required String offerId,
  }) async {
    emit(RejectDeliveryOfferLoading());
    final result = await updateDeliveryDataUseCase.excute(
      orderId: orderId,
      offerId: offerId,
      data: {'status': kstatusofferRejected},
    );

    result.fold(
      (failure) => emit(RejectDeliveryOfferFailure(failure.message)),
      (_) => emit(RejectDeliveryOfferSuccess()),
    );
  }
}

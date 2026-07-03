import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/add_offer_to_order_by_delivey_use_case.dart';
import 'package:meta/meta.dart';

part 'add_new_offer_to_order_state.dart';




class AddDeliveryOfferCubit extends Cubit<AddDeliveryOfferState> {
  AddDeliveryOfferCubit(this.addDeliveryOfferUseCase)
    : super(AddDeliveryOfferInitial());

  final AddDeliveryOfferUseCase addDeliveryOfferUseCase;

  Future<void> addDeliveryOffer({
    required String orderID,
    required double proposedPrice,
  }) async {
    emit(AddDeliveryOfferLoading());

    final result = await addDeliveryOfferUseCase.excute(
      orderID: orderID,
      proposedPrice: proposedPrice,
    );

    result.fold(
      (failure) {
        emit(
          AddDeliveryOfferFailure(
            errorMessage: failure.message,
          ),
        );
      },
      (success) {
        emit(AddDeliveryOfferSuccess());
      },
    );
  }
}
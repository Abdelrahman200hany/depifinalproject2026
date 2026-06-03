import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/get_accepted_delivery_offers_use_case%20.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/get_accepted_deliveryoffers/get_accepted_delivery_offers_state.dart';

class AcceptedDeliveryOffersCubit extends Cubit<AcceptedDeliveryOffersState> {
  AcceptedDeliveryOffersCubit(this.getAcceptedDeliveryOffersUseCase)
    : super(AcceptedDeliveryOffersInitial());

  final GetAcceptedDeliveryOffersUseCase getAcceptedDeliveryOffersUseCase;

  Future<void> getAcceptedDeliveryOffers() async {
    emit(AcceptedDeliveryOffersLoading());

    final result = await getAcceptedDeliveryOffersUseCase.execute();

    result.fold(
      (failure) {
        emit(AcceptedDeliveryOffersFailure(failure.message));
      },
      (orders) {
        emit(AcceptedDeliveryOffersSuccess(orders));
      },
    );
  }
}

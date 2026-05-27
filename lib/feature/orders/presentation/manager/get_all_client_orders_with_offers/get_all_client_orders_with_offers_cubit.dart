import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_clinet_order_with_offers_use_case.dart';
import 'package:meta/meta.dart';

part 'get_all_client_orders_with_offers_state.dart';

class GetClientOrdersWithOffersCubit
    extends Cubit<GetAllClientOrdersWithOffersState> {
  GetClientOrdersWithOffersCubit(this.getAllClientOrdersWithOffersUseCase)
    : super(GetAllClientOrdersWithOffersInitial());

  final GetAllClientOrdersWithOffersUseCase getAllClientOrdersWithOffersUseCase;

  Future<void> getOrdersWithOffers() async {
    emit(GetClientOrdersWithOffersLoading());

    final result = await getAllClientOrdersWithOffersUseCase.excute();

    result.fold(
      (failure) {
        emit(GetClientOrdersWithOffersFailure(failure.message));
      },

      (ordersList) {
        emit(GetClientOrdersWithOffersSuccess(ordersList));
      },
    );
  }
}

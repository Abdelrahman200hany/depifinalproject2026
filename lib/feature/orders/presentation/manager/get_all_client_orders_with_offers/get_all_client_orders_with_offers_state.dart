part of 'get_all_client_orders_with_offers_cubit.dart';

@immutable
sealed class GetAllClientOrdersWithOffersState {}

final class GetAllClientOrdersWithOffersInitial
    extends GetAllClientOrdersWithOffersState {}

final class GetClientOrdersWithOffersLoading
    extends GetAllClientOrdersWithOffersState {}

final class GetClientOrdersWithOffersSuccess
    extends GetAllClientOrdersWithOffersState {
  final List<OrderEntity> ordersList;

  GetClientOrdersWithOffersSuccess(this.ordersList);
}

final class GetClientOrdersWithOffersFailure
    extends GetAllClientOrdersWithOffersState {
  final String errorMessage;

  GetClientOrdersWithOffersFailure(this.errorMessage);
}

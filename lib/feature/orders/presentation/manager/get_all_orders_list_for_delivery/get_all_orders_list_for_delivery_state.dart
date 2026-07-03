part of 'get_all_orders_list_for_delivery_cubit.dart';

@immutable
sealed class GetAllOrdersListForDeliveryState {}

final class GetAllOrdersListForDeliveryInitial
    extends GetAllOrdersListForDeliveryState {}

final class GetAllOrdersListForDeliveryLoading
    extends GetAllOrdersListForDeliveryState {}

final class GetAllOrdersListForDeliverySuccess
    extends GetAllOrdersListForDeliveryState {
  final List<OrderEntity> orderList;

  GetAllOrdersListForDeliverySuccess({required this.orderList});
}

final class GetAllOrdersListForDeliveryFualire
    extends GetAllOrdersListForDeliveryState {
  final String errorMessage;

  GetAllOrdersListForDeliveryFualire(this.errorMessage);
}

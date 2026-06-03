import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

abstract class AcceptedDeliveryOffersState {}

class AcceptedDeliveryOffersInitial extends AcceptedDeliveryOffersState {}

class AcceptedDeliveryOffersLoading extends AcceptedDeliveryOffersState {}

class AcceptedDeliveryOffersSuccess extends AcceptedDeliveryOffersState {
  final List<OrderEntity> orders;

  AcceptedDeliveryOffersSuccess(this.orders);
}

class AcceptedDeliveryOffersFailure extends AcceptedDeliveryOffersState {
  final String errorMessage;

  AcceptedDeliveryOffersFailure(this.errorMessage);
}

part of 'reject_delivery_offer_cubit.dart';

@immutable
sealed class RejectDeliveryOfferState {}

final class RejectDeliveryOfferInitial extends RejectDeliveryOfferState {}

final class RejectDeliveryOfferLoading extends RejectDeliveryOfferState {}

final class RejectDeliveryOfferSuccess extends RejectDeliveryOfferState {}

final class RejectDeliveryOfferFailure extends RejectDeliveryOfferState {
  final String errorMessage;

  RejectDeliveryOfferFailure(this.errorMessage);
}

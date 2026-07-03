part of 'accept_delivery_offer_cubit.dart';

@immutable
sealed class AcceptDeliveryOfferState {}

final class AcceptDeliveryOfferInitial
    extends AcceptDeliveryOfferState {}

final class AcceptDeliveryOfferLoading
    extends AcceptDeliveryOfferState {}

final class AcceptDeliveryOfferSuccess
    extends AcceptDeliveryOfferState {}

final class AcceptDeliveryOfferFailure
    extends AcceptDeliveryOfferState {
  final String errorMessage;

  AcceptDeliveryOfferFailure({
    required this.errorMessage,
  });
}
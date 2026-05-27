part of 'add_new_offer_to_order_cubit.dart';

@immutable

sealed class AddDeliveryOfferState {}

final class AddDeliveryOfferInitial extends AddDeliveryOfferState {}

final class AddDeliveryOfferLoading extends AddDeliveryOfferState {}

final class AddDeliveryOfferSuccess extends AddDeliveryOfferState {}

final class AddDeliveryOfferFailure extends AddDeliveryOfferState {
  final String errorMessage;

  AddDeliveryOfferFailure({
    required this.errorMessage,
  });
}
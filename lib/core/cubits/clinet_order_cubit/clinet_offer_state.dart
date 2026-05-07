part of 'clinet_offer_cubit.dart';

@immutable
sealed class ClinetOrderState {}

final class ClinetOrderInitial extends ClinetOrderState {}

final class ClinetOrderLoading extends ClinetOrderState {}

final class ClinetOrderSuccess extends ClinetOrderState {
  final List<OrderEntity> ordersList;

  ClinetOrderSuccess(this.ordersList);
}

final class ClinetOrderFualire extends ClinetOrderState {
  final String errorMessage;

  ClinetOrderFualire(this.errorMessage);
}

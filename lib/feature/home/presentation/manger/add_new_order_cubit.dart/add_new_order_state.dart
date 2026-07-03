part of 'add_new_order_cubit.dart';

@immutable
sealed class AddNewOrderState {}

final class AddNewOrderInitial extends AddNewOrderState {}

final class AddNewOrderLoading extends AddNewOrderState {}

final class AddNewOrderSuccess extends AddNewOrderState {}

final class AddNewOrderFailure extends AddNewOrderState {
  final String errorMessage;

  AddNewOrderFailure({required this.errorMessage});
}

part of 'clinet_order_delete_manager_cubit.dart';

@immutable
sealed class ClinetOrderManagerDeleteState {}

final class ClinetOrderManagerDeleteInitial extends ClinetOrderManagerDeleteState {}
final class ClinetOrderManagerDeleteLoading extends ClinetOrderManagerDeleteState {}
final class ClinetOrderManagerDeleteSuccess extends ClinetOrderManagerDeleteState {}
final class ClinetOrderManagerDeleteFaulire extends ClinetOrderManagerDeleteState {
  final String errorMessage;

  ClinetOrderManagerDeleteFaulire(this.errorMessage);
}

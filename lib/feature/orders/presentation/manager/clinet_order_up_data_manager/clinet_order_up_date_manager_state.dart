part of 'clinet_order_up_date_manager_cubit.dart';

@immutable
sealed class ClinetOrderUpDateManagerState {}

final class ClinetOrderUpDateManagerInitial
    extends ClinetOrderUpDateManagerState {}

final class ClinetOrderUpDateManagerLoading
    extends ClinetOrderUpDateManagerState {}

final class ClinetOrderUpDateManagerSuccess
    extends ClinetOrderUpDateManagerState {}

final class ClinetOrderUpDateManagerFaulire
    extends ClinetOrderUpDateManagerState {
  final String errorMessage;

  ClinetOrderUpDateManagerFaulire(this.errorMessage);
}

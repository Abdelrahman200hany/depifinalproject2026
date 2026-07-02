abstract class RefreshUserDataState {}

class RefreshUserDataInitial extends RefreshUserDataState {}

class RefreshUserDataLoading extends RefreshUserDataState {}

class RefreshUserDataSuccess extends RefreshUserDataState {}

class RefreshUserDataFailure extends RefreshUserDataState {
  final String message;

  RefreshUserDataFailure(this.message);
}

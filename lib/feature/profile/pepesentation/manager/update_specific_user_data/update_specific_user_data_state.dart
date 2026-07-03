abstract class UpdateSpecificUserDataState {}

class UpdateSpecificUserDataInitial extends UpdateSpecificUserDataState {}

class UpdateSpecificUserDataLoading extends UpdateSpecificUserDataState {}

class UpdateSpecificUserDataSuccess extends UpdateSpecificUserDataState {}

class UpdateSpecificUserDataFailure extends UpdateSpecificUserDataState {
  final String message;

  UpdateSpecificUserDataFailure(this.message);
}

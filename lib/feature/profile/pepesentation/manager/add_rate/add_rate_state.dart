abstract class AddRateState {}

class AddRateInitial extends AddRateState {}

class AddRateLoading extends AddRateState {}

class AddRateSuccess extends AddRateState {}

class AddRateFailure extends AddRateState {
  final String message;

  AddRateFailure(this.message);
}

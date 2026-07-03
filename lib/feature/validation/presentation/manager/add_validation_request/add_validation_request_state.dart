
abstract class AddValidationRequestState {}

class AddValidationRequestInitial extends AddValidationRequestState {}

class AddValidationRequestLoading extends AddValidationRequestState {}

class AddValidationRequestSuccess extends AddValidationRequestState {}

class AddValidationRequestFailure extends AddValidationRequestState {
  final String message;

  AddValidationRequestFailure(this.message);
}

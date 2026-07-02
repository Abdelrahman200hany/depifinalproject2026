abstract class ApproveValidationRequestState {}

class ApproveValidationRequestInitial extends ApproveValidationRequestState {}

class ApproveValidationRequestLoading extends ApproveValidationRequestState {}

class ApproveValidationRequestSuccess extends ApproveValidationRequestState {}

class ApproveValidationRequestFailure extends ApproveValidationRequestState {
  final String message;

  ApproveValidationRequestFailure(this.message);
}

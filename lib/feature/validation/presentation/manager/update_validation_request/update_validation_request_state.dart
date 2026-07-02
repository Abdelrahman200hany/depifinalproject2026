abstract class UpdateValidationRequestState {}



class UpdateValidationRequestInitial
    extends UpdateValidationRequestState {}



class UpdateValidationRequestLoading
    extends UpdateValidationRequestState {}



class UpdateValidationRequestSuccess
    extends UpdateValidationRequestState {}



class UpdateValidationRequestFailure
    extends UpdateValidationRequestState {


  final String message;


  UpdateValidationRequestFailure(
      this.message
      );


}
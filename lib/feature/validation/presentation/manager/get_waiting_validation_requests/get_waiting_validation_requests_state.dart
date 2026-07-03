import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';

abstract class GetWaitingValidationRequestsState {}

class GetWaitingValidationRequestsInitial
    extends GetWaitingValidationRequestsState {}

class GetWaitingValidationRequestsLoading
    extends GetWaitingValidationRequestsState {}

class GetWaitingValidationRequestsSuccess
    extends GetWaitingValidationRequestsState {
  final List<ValidationRequestEntity> requests;

  GetWaitingValidationRequestsSuccess(this.requests);
}

class GetWaitingValidationRequestsFailure
    extends GetWaitingValidationRequestsState {
  final String message;

  GetWaitingValidationRequestsFailure(this.message);
}

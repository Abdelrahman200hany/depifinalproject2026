import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';

abstract class GetValidationRequestState {}

class GetValidationRequestInitial extends GetValidationRequestState {}

class GetValidationRequestLoading extends GetValidationRequestState {}

class GetValidationRequestSuccess extends GetValidationRequestState {
  final ValidationRequestEntity request;

  GetValidationRequestSuccess(this.request);
}

class GetValidationRequestFailure extends GetValidationRequestState {
  final String message;

  GetValidationRequestFailure(this.message);
}

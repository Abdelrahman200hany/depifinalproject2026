import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';

abstract class GetRatesState {}

class GetRatesInitial extends GetRatesState {}

class GetRatesLoading extends GetRatesState {}

class GetRatesSuccess extends GetRatesState {
  final List<RateEntity> rates;

  GetRatesSuccess(this.rates);
}

class GetRatesFailure extends GetRatesState {
  final String message;

  GetRatesFailure(this.message);
}

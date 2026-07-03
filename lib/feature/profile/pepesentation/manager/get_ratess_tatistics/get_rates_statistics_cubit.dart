abstract class GetRatesStatisticsState {}

class GetRatesStatisticsInitial extends GetRatesStatisticsState {}

class GetRatesStatisticsLoading extends GetRatesStatisticsState {}

class GetRatesStatisticsFailure extends GetRatesStatisticsState {
  final String message;

  GetRatesStatisticsFailure(this.message);
}

class GetRatesStatisticsSuccess extends GetRatesStatisticsState {
  final int ratesCount;

  final double averageRate;

  final double satisfactionRate;

  final int fiveStars;

  final int fourStars;

  final int threeStars;

  final int twoStars;

  final int oneStar;

  GetRatesStatisticsSuccess({
    required this.ratesCount,
    required this.averageRate,
    required this.satisfactionRate,
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStar,
  });
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/get_rates_use_case.dart';
import 'get_rates_state.dart';

class GetRatesCubit extends Cubit<GetRatesState> {
  final GetRatesUseCase getRatesUseCase;

  GetRatesCubit(this.getRatesUseCase) : super(GetRatesInitial());

  List<RateEntity> rates = [];

  int ratesCount = 0;
  double satisfactionRate = 0;

  double averageRate = 0;

  Future<void> getRates({required String targetUserId}) async {
    emit(GetRatesLoading());

    final result = await getRatesUseCase.execute(targetUserId: targetUserId);

    result.fold(
      (failure) {
        emit(GetRatesFailure(failure.message));
      },

      (rateList) {
        rates = rateList;

        ratesCount = rates.length;

        averageRate = calculateAverageRate(rates);
        satisfactionRate = calculateSatisfactionRate(averageRate);

        emit(GetRatesSuccess(rates));
      },
    );
  }

  double calculateAverageRate(List<RateEntity> rates) {
    if (rates.isEmpty) {
      return 0;
    }

    double totalRate = 0;

    for (var rate in rates) {
      totalRate += rate.rate;
    }

    return totalRate / rates.length;
  }

  double calculateSatisfactionRate(double averageRate) {
    return (averageRate / 5) * 100;
  }
}

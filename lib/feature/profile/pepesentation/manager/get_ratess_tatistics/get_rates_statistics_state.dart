import 'package:depifinalproject/feature/profile/pepesentation/manager/get_ratess_tatistics/get_rates_statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/get_rates_use_case.dart';

class GetRatesStatisticsCubit extends Cubit<GetRatesStatisticsState> {
  GetRatesStatisticsCubit(this.getRatesUseCase)
    : super(GetRatesStatisticsInitial());

  final GetRatesUseCase getRatesUseCase;

  Future<void> getRatesStatistics({required String targetUserId}) async {
    emit(GetRatesStatisticsLoading());

    final result = await getRatesUseCase.execute(targetUserId: targetUserId);

    result.fold(
      (failure) {
        emit(GetRatesStatisticsFailure(failure.message));
      },
      (rates) {
        int ratesCount = rates.length;

        double totalRate = 0.0;

        int fiveStars = 0;
        int fourStars = 0;
        int threeStars = 0;
        int twoStars = 0;
        int oneStar = 0;

        for (final rate in rates) {
          totalRate += rate.rate.toDouble();

          switch (rate.rate) {
            case 5:
              fiveStars++;
              break;

            case 4:
              fourStars++;
              break;

            case 3:
              threeStars++;
              break;

            case 2:
              twoStars++;
              break;

            case 1:
              oneStar++;
              break;
          }
        }

        double averageRate = 0.0;

        if (ratesCount > 0) {
          averageRate = totalRate / ratesCount;
        }

        double satisfactionRate = (averageRate / 5.0) * 100.0;

        emit(
          GetRatesStatisticsSuccess(
            ratesCount: ratesCount,
            averageRate: averageRate,
            satisfactionRate: satisfactionRate,
            fiveStars: fiveStars,
            fourStars: fourStars,
            threeStars: threeStars,
            twoStars: twoStars,
            oneStar: oneStar,
          ),
        );
      },
    );
  }
}

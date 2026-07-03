import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/GetRates/get_rates_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/GetRates/get_rates_state.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/profile_stats.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/review_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewViewDetails extends StatelessWidget {
  const ReviewViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<GetRatesCubit>()
            ..getRates(targetUserId: getUserData().userID!),
      child: BlocConsumer<GetRatesCubit, GetRatesState>(
        listener: (context, state) {
          if (state is GetRatesFailure) {
            showfaulireSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is GetRatesSuccess) {
            GetRatesCubit value = context.read<GetRatesCubit>();
            return Column(
              children: [
                ProfileStats(numberOfreviews: value.ratesCount,
                avgRate: value.averageRate,
                satisfactionRate: value.satisfactionRate,),
                SizedBox(height: 30),
                ReviewsSection(rateList: state.rates),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColor.kPrimaryColor),
            );
          }
        },
      ),
    );
  }
}







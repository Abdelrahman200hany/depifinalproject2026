import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_offer_cubit.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offers_view_builder_for_clinet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferViewforClinet extends StatelessWidget {
  const OfferViewforClinet({super.key});
  static const routeName = 'OfferViewforClinet';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ClinetOrderCubit(getIt.get<GetClinetOrderUseCase>())..getAlloffers(),
      child: const OffersViewBodyBlocBuilerForClinets(),
    );
  }
}

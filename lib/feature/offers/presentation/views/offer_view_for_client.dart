import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offers_view_builder_for_clinet.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_clinet_order_with_offers_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_client_orders_with_offers/get_all_client_orders_with_offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferViewforClinet extends StatelessWidget {
  const OfferViewforClinet({super.key});
  static const routeName = 'OfferViewforClinet';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetClientOrdersWithOffersCubit(
        getIt.get<GetAllClientOrdersWithOffersUseCase>(),
      )..getOrdersWithOffers(),
      child: const OffersViewBodyBlocBuilerForClinets(),
    );
  }
}

import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/get_accepted_delivery_offers_use_case%20.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/get_accepted_deliveryoffers/get_accepted_delivery_offers_cubit.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_view_for_delivery_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferViewForDelivery extends StatelessWidget {
  const OfferViewForDelivery({super.key});
  static const routeName = 'OfferViewForDelivery';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceptedDeliveryOffersCubit(
        getIt.get<GetAcceptedDeliveryOffersUseCase>(),
      )..getAcceptedDeliveryOffers(),
      child: const OfferViewForDeliveryBody(),
    );
  }
}

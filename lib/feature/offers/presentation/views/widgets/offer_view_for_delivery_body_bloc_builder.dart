import 'package:depifinalproject/core/methods/get_dummy_orders.dart';
import 'package:depifinalproject/core/widgets/empty_custom_widget.dart';
import 'package:depifinalproject/core/widgets/faulire_custom_widget.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/get_accepted_deliveryoffers/get_accepted_delivery_offers_cubit.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/get_accepted_deliveryoffers/get_accepted_delivery_offers_state.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/cart_delivey_offer_details_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OfferViewForDeliveryBodyBlocBuilder extends StatelessWidget {
  const OfferViewForDeliveryBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      AcceptedDeliveryOffersCubit,
      AcceptedDeliveryOffersState
    >(
      builder: (context, state) {
        if (state is AcceptedDeliveryOffersFailure) {
          return FaulireCustomwidget(
            wantedAppBar: false,
            ontap: () {
              context
                  .read<AcceptedDeliveryOffersCubit>()
                  .getAcceptedDeliveryOffers();
            },
          );
        } else if (state is AcceptedDeliveryOffersSuccess) {
          if (state.orders.isEmpty) {
            return EmptyCustomwidget(
              wantedAppBar: false,
              emptyText: 'لا يوجد عروض مقبولة',
              hint: 'انتظر حتى يتم قبول عرضك من قبل العميل',
            );
          } else {
            return CartDeliveryOfferDetailsList(orders: state.orders);
          }
        } else {
          return Skeletonizer(
            enabled: true,
            child: CartDeliveryOfferDetailsList(
              orders: GetDummyOrders.ordersList,
            ),
          );
        }
      },
    );
  }
}

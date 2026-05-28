import 'package:depifinalproject/core/consts/consts.dart';

import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_client_orders_with_offers/get_all_client_orders_with_offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferViewBodyforClinet extends StatelessWidget {
  const OfferViewBodyforClinet({super.key, required this.orderList});
  final List<OrderEntity> orderList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'عروض المناديب'),

      body: RefreshIndicator(
        // make sure this line may be don't shoud have await and async
        onRefresh: () async {
          await context
              .read<GetClientOrdersWithOffersCubit>()
              .getOrdersWithOffers();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: orderList.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 12, top: 2),
              child: OfferDetails(
                order: orderList[index],
                offers: orderList[index].deliveryOffers ?? [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

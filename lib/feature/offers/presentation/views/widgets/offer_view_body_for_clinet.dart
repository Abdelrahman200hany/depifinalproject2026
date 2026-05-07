import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_offer_cubit.dart';

import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_details.dart';
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
          await  context.read<ClinetOrderCubit>().getAlloffers();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 9,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 12, top: 2),
              child: OfferDetails(),
            ),
          ),
        ),
      ),
    );
  }
}

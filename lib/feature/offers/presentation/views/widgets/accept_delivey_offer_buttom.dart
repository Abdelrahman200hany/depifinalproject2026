import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/accept_delivery_offer_use_case.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/accept_delivery_offer.dart/accept_delivery_offer_cubit.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccectDeliveryOfferButtom extends StatelessWidget {
  const AccectDeliveryOfferButtom({
    super.key,
    required this.order,
    required this.delivery,
  });

  final OrderEntity order;
  final DeliveryEntity delivery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AcceptDeliveryOfferCubit(getIt.get<AcceptDeliveryOfferUseCase>()),
      child: Expanded(
        child: BlocConsumer<AcceptDeliveryOfferCubit, AcceptDeliveryOfferState>(
          listener: (context, state) {
            if (state is AcceptDeliveryOfferFailure) {
              showfaulireSnackBar(context, message: state.errorMessage);
            }
            if (state is AcceptDeliveryOfferSuccess) {
              showSuccessSnackBar(context, message: 'تم قبول الطلب بنجاح');
              Navigator.pushNamedAndRemoveUntil(
                context,
                MainView.routeName,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return CustomTextBottomWithBackground(
              ontap: () {
                context.read<AcceptDeliveryOfferCubit>().acceptDeliveryOffer(
                  orderId: order.uIdOrder,
                  offerId: delivery.driver.userID!,
                  deliveryName: delivery.driver.userID!,
                  newUpDatedOrder: order,
                  oldOrder: order,
                  deliveryPrice: delivery.proposedPrice,
                );
              },
              isLoading: state is AcceptDeliveryOfferLoading ? true : false,
              text: 'قبول الطلب',
            );
          },
        ),
      ),
    );
  }
}

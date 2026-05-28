import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/update_delivery_data_use_case.dart';
import 'package:depifinalproject/feature/offers/presentation/manager/reject_delivery_offer/reject_delivery_offer_cubit.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_client_orders_with_offers/get_all_client_orders_with_offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectDeliveryOfferButtom extends StatelessWidget {
  const RejectDeliveryOfferButtom({
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
          RejectDeliveryOfferCubit(getIt.get<UpdateDeliveryDataUseCase>()),
      child: Expanded(
        child: BlocConsumer<RejectDeliveryOfferCubit, RejectDeliveryOfferState>(
          listener: (context, state) {
            if (state is RejectDeliveryOfferFailure) {
              showfaulireSnackBar(context, message: state.errorMessage);
            }

            if (state is RejectDeliveryOfferSuccess) {
              showSuccessSnackBar(context, message: 'تم رفض الطلب بنجاح');

              context
                  .read<GetClientOrdersWithOffersCubit>()
                  .getOrdersWithOffers();
       
            }
          },
          builder: (context, state) {
            return CustomTextBottomWithBackground(
              text: 'رفض الطلب',
              backgroundColor: AppColor.kRatingColor,
              isLoading: state is RejectDeliveryOfferLoading,
              ontap: () {
                context.read<RejectDeliveryOfferCubit>().rejectDeliveryOffer(
                  orderId: order.uIdOrder,
                  offerId: delivery.driver.userID!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_Order_state.dart';
import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_order_cubit.dart';
import 'package:depifinalproject/core/methods/get_dummy_orders.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/widgets/empty_custom_widget.dart';
import 'package:depifinalproject/core/widgets/faulire_custom_widget.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/offer_view_body_for_clinet.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/get_all_client_orders_with_offers/get_all_client_orders_with_offers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OffersViewBodyBlocBuilerForClinets extends StatelessWidget {
  const OffersViewBodyBlocBuilerForClinets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      GetClientOrdersWithOffersCubit,
      GetAllClientOrdersWithOffersState
    >(
      listener: (context, state) {
        if (state is GetClientOrdersWithOffersFailure) {
          showfaulireSnackBar(context, message: state.errorMessage);
        }
        if (state is GetClientOrdersWithOffersSuccess) {
          showSuccessSnackBar(
            context,
            message: 'لقد تم جلب البيانات  ${state.ordersList.length}',
          );
        }
        if (state is ClinetOrderLoading) {
          showSuccessSnackBar(context, message: 'لقد تم جلب البيانات');
        }
      },
      builder: (context, state) {
        if (state is GetClientOrdersWithOffersSuccess) {
          if (state.ordersList.isEmpty) {
            return EmptyCustomwidget(
              appBarhint: 'عروض',
              emptyText: 'عروض',
              hint: 'قم ب اضافة الطلبات اولا',
            );
          } else {
            return OfferViewBodyforClinet(orderList: state.ordersList);
          }
        } else if (state is ClinetOrderFualire) {
          return FaulireCustomwidget(
            appBarhint: 'العروض',
            ontap: () {
              context.read<ClinetOrderCubit>().getAllorders();
            },
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: OfferViewBodyforClinet(orderList: GetDummyOrders.ordersList),
          );
        }
      },
    );
  }
}

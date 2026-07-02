import 'package:depifinalproject/feature/orders/presentation/manager/cubit/orders_report_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';

class OrdersReportCubit extends Cubit<OrdersReportState> {
  OrdersReportCubit(this.useCase) : super(OrdersReportInitial());

  final GetClinetOrderUseCase useCase;

  Future<void> getOrdersReport() async {
    emit(OrdersReportLoading());

    final result = await useCase.excute();

    result.fold(
      (failure) {
        emit(OrdersReportFailure(failure.message));
      },
      (orders) {
        int waitingAccept = 0;
        int waitingDelivery = 0;
        int onWay = 0;
        int delivered = 0;
        int returned = 0;

        double parcelPrice = 0;

        for (final order in orders) {
          switch (order.orderStatus) {
            case kOfferWaitingAccept:
              waitingAccept++;
              break;

            case kstatusWaiting:
              waitingDelivery++;
              break;

            case kstatusOnWay:
              onWay++;
              break;

            case kstatusDelivered:
              delivered++;
              parcelPrice += order.parcelPrice;
              break;

            case kstatusReturned:
              returned++;
              break;
          }
        }

        emit(
          OrdersReportSuccess(
            orders: orders,
            allOrders: orders.length,
            waitingAccept: waitingAccept,
            waitingDelivery: waitingDelivery,
            onWay: onWay,
            delivered: delivered,
            returned: returned,
            parcelPrice: parcelPrice,
          ),
        );
      },
    );
  }
}

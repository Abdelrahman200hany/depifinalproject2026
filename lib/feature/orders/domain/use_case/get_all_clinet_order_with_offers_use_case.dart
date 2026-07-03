import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_offers_related_to_orders_use_case.dart';

class GetAllClientOrdersWithOffersUseCase {
  final GetClinetOrderUseCase getClinetOrderUseCase;

  final GetAllOffersRelatedToOrderUseCase getAllOffersRelatedToOrderUseCase;

  GetAllClientOrdersWithOffersUseCase(
    this.getClinetOrderUseCase,
    this.getAllOffersRelatedToOrderUseCase,
  );

  Future<Either<Failure, List<OrderEntity>>> excute() async {
    final ordersResult = await getClinetOrderUseCase.excute(
      query: {
        'orderStatus':kOfferWaitingAccept
      }
    );

    return await ordersResult.fold(
      (failure) async {
        return left(failure);
      },

      (ordersList) async {
        for (var order in ordersList) {
          final offersResult = await getAllOffersRelatedToOrderUseCase.excute(
            orderid: order.uIdOrder,
          );

          offersResult.fold(
            (failure) {
              order.deliveryOffers = [];
            },

            (offers) {
              order.deliveryOffers = offers;
            },
          );
        }

        return right(ordersList);
      },
    );
  }
}

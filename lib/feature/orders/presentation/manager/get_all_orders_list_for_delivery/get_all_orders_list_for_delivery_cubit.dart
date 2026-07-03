import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

import 'package:depifinalproject/feature/orders/domain/use_case/get_all_orders_for_delivery_use_case.dart';
import 'package:meta/meta.dart';

part 'get_all_orders_list_for_delivery_state.dart';

class GetAllOrdersListForDeliveryCubit
    extends Cubit<GetAllOrdersListForDeliveryState> {
  GetAllOrdersListForDeliveryCubit(this.useCase)
    : super(GetAllOrdersListForDeliveryInitial());
  final GetAllOrdersForDeliveryUseCase useCase;



  Future<void> getOrdersListForDelivery() async {
    emit(GetAllOrdersListForDeliveryLoading());
    var result = await useCase.execute();

    result.fold(
      (fualire) {
        emit(GetAllOrdersListForDeliveryFualire(fualire.message));
      },
      (orderList) {
        emit(GetAllOrdersListForDeliverySuccess(orderList:orderList ));
      },
    );
  }
}

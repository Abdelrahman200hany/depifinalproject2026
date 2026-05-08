import 'package:bloc/bloc.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/cubits/clinet_order_cubit/clinet_Order_state.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class ClinetOrderCubit extends Cubit<ClinetOrderState> {
  ClinetOrderCubit(this.us) : super(ClinetOrderInitial());

  final GetClinetOrderUseCase us;
  // List<OrderEntity> orderList = [];

  // ✅ الـ status values اللي بتيجي من الـ backend

  Future<void> getAllorders() async {
    emit(ClinetOrderLoading());

    var result = await us.excute();

    result.fold(
      (faulire) {
        emit(ClinetOrderFualire(faulire.message));
      },
      (offerList) {
        // orderList = offerList;
        emit(ClinetOrderSuccess(offerList));
      },
    );
  }

  // ✅ دي بترجع الـ list بناءً على الـ tab index
  List<OrderEntity> getFilteredOrders(
    int tabIndex,
    List<OrderEntity> orderList,
  ) {
    switch (tabIndex) {
      case 0: // الكل
        return orderList;
      case 1: // في انتظار المندوب
        return orderList
            .where((order) => order.orderStatus == kstatusWaiting)
            .toList();
      case 2: // في الطريق الي العميل
        return orderList
            .where((order) => order.orderStatus == kstatusOnWay)
            .toList();
      case 3: // تم التوصيل
        return orderList
            .where((order) => order.orderStatus == kstatusDelivered)
            .toList();
      case 4: // مرتجع
        return orderList
            .where((order) => order.orderStatus == kstatusReturned)
            .toList();
      default:
        return orderList;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_simple_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/update_simple_order/update_simple_order_state.dart';

class UpdateSimpleOrderCubit extends Cubit<UpdateSimpleOrderState> {
  final UpdateSimpleOrderDataUseCase useCase;

  UpdateSimpleOrderCubit(this.useCase) : super(UpdateSimpleOrderInitial());

  Future<void> updateSimpleOrderData({
    required String orderId,

    required Map<String, dynamic> data,
  }) async {
    emit(UpdateSimpleOrderLoading());

    final result = await useCase(orderId: orderId, data: data);

    result.fold(
      (failure) {
        emit(UpdateSimpleOrderFailure(failure.message));
      },

      (_) {
        emit(UpdateSimpleOrderSuccess());
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/delete_order_by_clinet_use_case.dart';
import 'package:meta/meta.dart';

part 'clinet_order_delete_manager_state.dart';

class ClinetOrderManagerDeleteCubit extends Cubit<ClinetOrderManagerDeleteState> {
  ClinetOrderManagerDeleteCubit(this.us) : super(ClinetOrderManagerDeleteInitial());

  final DeleteOrderByClinetUseCase us;

  Future<void> deleteOrder({required String orderId}) async {
    emit(ClinetOrderManagerDeleteLoading());

    var result = await us.excute(orderId: orderId);
    result.fold(
      (faulire) {
        emit(ClinetOrderManagerDeleteFaulire(faulire.message));
      },
      (success) {
        emit(ClinetOrderManagerDeleteSuccess());
      },
    );
  }
}

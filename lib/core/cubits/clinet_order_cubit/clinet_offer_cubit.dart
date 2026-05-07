import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:meta/meta.dart';

part 'clinet_offer_state.dart';

class ClinetOrderCubit extends Cubit<ClinetOrderState> {
  ClinetOrderCubit(this.us) : super(ClinetOrderInitial());

  final GetClinetOrderUseCase us;

  Future<void> getAlloffers() async {
    emit(ClinetOrderLoading());

    var result = await us.excute();

    result.fold((faulire) {
      emit(ClinetOrderFualire(faulire.message));
    }, (offerList) => emit(ClinetOrderSuccess(offerList)));
  }
}

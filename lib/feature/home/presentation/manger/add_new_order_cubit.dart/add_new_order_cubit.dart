import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/home/domin/use_case/add_order_use_case.dart';
import 'package:depifinalproject/feature/home/domin/use_case/upload_order_image_use_case.dart';
import 'package:meta/meta.dart';

part 'add_new_order_state.dart';

class AddNewOrderCubit extends Cubit<AddNewOrderState> {
  AddNewOrderCubit(this.addNewOrderUseCase, this.uploadOrderImageUseCase)
    : super(AddNewOrderInitial());

  final AddNewOrderUseCase addNewOrderUseCase;
  final UploadOrderImageUseCase uploadOrderImageUseCase;

  Future<void> addNewCompleteOrder({required OrderEntity order}) async {
    emit(AddNewOrderLoading());
    var result = await uploadOrderImageUseCase.excute(
      imagefile: order.imageFile!,
    );
    result.fold(
      (failure) => emit(AddNewOrderFailure(errorMessage: failure.message)),
      (imageUrl) async {
        order.parcelImage = imageUrl;
        var addNeworder = await addNewOrderUseCase.excute(order: order);
        addNeworder.fold(
          (failure) => emit(AddNewOrderFailure(errorMessage: failure.message)),
          (success) => emit(AddNewOrderSuccess()),
        );
      },
    );
    // Continue with the rest of the order creation logicuploadOrderImageUseCase is successful, you can proceed to create the order with the obtained image URL.
  }
}

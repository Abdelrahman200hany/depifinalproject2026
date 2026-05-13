import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/up_data_order_data_by_clinet.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_order_image_by_clinet_use_case.dart';
import 'package:meta/meta.dart';

part 'clinet_order_up_date_manager_state.dart';

class ClinetOrderUpDateManagerCubit
    extends Cubit<ClinetOrderUpDateManagerState> {
  ClinetOrderUpDateManagerCubit(this.imageUseCase, this.dataUseCase)
    : super(ClinetOrderUpDateManagerInitial());

  final UpDataOrderImageByClinetUseCase imageUseCase;
  final UpDataOrderDataByClinet dataUseCase;

  Future<void> updateOrder({
    required String orderId,
    required OrderEntity oldOrder,
    required OrderEntity newOrder,
  }) async {
    emit(ClinetOrderUpDateManagerLoading());

    String? imageUrl = newOrder.parcelImage;

    // ✅ لو المستخدم غيّر الصورة
    if (newOrder.imageFile != null) {
      final imageResult = await imageUseCase.excute(
        file: newOrder.imageFile!,
        oldImageUrl: oldOrder.parcelImage!,
      );

      imageResult.fold(
        (failure) {
          emit(ClinetOrderUpDateManagerFaulire(failure.message));
        },
        (url) async {
          imageUrl = url;

          await CachedNetworkImage.evictFromCache(url);

          final updatedOrder = newOrder.copyWith(
            parcelImage: imageUrl,
            imageVersion: oldOrder.imageVersion + 1,
          );

          final result = await dataUseCase.excute(
            orderId: orderId,
            newUpDatedOrder: updatedOrder,
            oldOrder: oldOrder,
          );

          result.fold(
            (failure) {
              emit(ClinetOrderUpDateManagerFaulire(failure.message));
            },
            (_) {
              emit(ClinetOrderUpDateManagerSuccess());
            },
          );
        },
      );

      return;
    }

    // ✅ لو مفيش صورة جديدة
    final updatedOrder = newOrder.copyWith(
      parcelImage: imageUrl,
      imageVersion: oldOrder.imageVersion,
    );

    final result = await dataUseCase.excute(
      orderId: orderId,
      newUpDatedOrder: updatedOrder,
      oldOrder: oldOrder,
    );

    result.fold(
      (failure) {
        emit(ClinetOrderUpDateManagerFaulire(failure.message));
      },
      (_) {
        emit(ClinetOrderUpDateManagerSuccess());
      },
    );
  }

  // Future<void> updateOrder({
  //   required String orderId,
  //   required OrderEntity oldOrder,
  //   required OrderEntity newOrder,
  // }) async {
  //   emit(ClinetOrderUpDateManagerLoading());

  //   String? imageUrl = newOrder.parcelImage;

  //   // لو المستخدم غيّر الصورة
  //   if (newOrder.imageFile != null) {
  //     final imageResult = await imageUseCase.excute(
  //       file: newOrder.imageFile!,
  //       oldImageUrl: oldOrder.parcelImage!,
  //     );

  //     imageResult.fold(
  //       (failure) {
  //         emit(ClinetOrderUpDateManagerFaulire(failure.message));
  //         return;
  //       },
  //       (url) async {
  //         imageUrl = url;
  //                 await CachedNetworkImage.evictFromCache(url);

  //       },
  //     );
  //   }

  //   // ✅ جهّز البيانات الجديدة
  //   final updatedOrder = newOrder.copyWith(
  //     parcelImage: imageUrl,
  //     imageVersion: newOrder.imageFile != null
  //         ? oldOrder.imageVersion + 1
  //         : oldOrder.imageVersion,
  //   );

  //   // ✅ تحديث البيانات
  //   final result = await dataUseCase.excute(
  //     orderId: orderId,
  //     newUpDatedOrder: updatedOrder,
  //     oldOrder: oldOrder,
  //   );

  //   result.fold(
  //     (failure) {
  //       emit(ClinetOrderUpDateManagerFaulire(failure.message));
  //     },
  //     (_) {
  //       emit(ClinetOrderUpDateManagerSuccess());
  //     },
  //   );
  // }
}

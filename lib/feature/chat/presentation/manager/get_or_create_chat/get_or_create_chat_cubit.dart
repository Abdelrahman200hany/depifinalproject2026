import 'package:depifinalproject/feature/chat/presentation/manager/get_or_create_chat/get_or_create_chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/feature/chat/domain/use_case/get_or_create_chat_use_case.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class GetOrCreateChatCubit extends Cubit<GetOrCreateChatState> {
  GetOrCreateChatCubit(this.useCase) : super(GetOrCreateChatInitial());

  final GetOrCreateChatUseCase useCase;

  Future<void> getOrCreateChat({required OrderEntity order}) async {
    emit(GetOrCreateChatLoading());

    final result = await useCase.execute(order: order);

    result.fold(
      (failure) {
        emit(GetOrCreateChatFailure(failure.message));
      },
      (chat) {
        emit(GetOrCreateChatSuccess(chat));
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'send_message_state.dart';

import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/chat/domain/use_case/send_message_use_case.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit(this.useCase) : super(SendMessageInitial());

  final SendMessageUseCase useCase;

  Future<void> sendMessage({
    required String chatId,
    required MessageEntity message,
  }) async {
    emit(SendMessageLoading());

    final result = await useCase.execute(chatId: chatId, message: message);

    result.fold(
      (failure) {
        emit(SendMessageFailure(failure.message));
      },
      (_) {
        emit(SendMessageSuccess());
      },
    );
  }
}

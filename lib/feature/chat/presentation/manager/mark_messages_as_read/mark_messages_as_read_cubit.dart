import 'package:flutter_bloc/flutter_bloc.dart';

import 'mark_messages_as_read_state.dart';

import 'package:depifinalproject/feature/chat/domain/use_case/mark_messages_as_read_use_case.dart';

class MarkMessagesAsReadCubit extends Cubit<MarkMessagesAsReadState> {
  MarkMessagesAsReadCubit(this.useCase) : super(MarkMessagesAsReadInitial());

  final MarkMessagesAsReadUseCase useCase;

  Future<void> markAsRead({
    required String chatId,
    required bool isClient,
  }) async {
    emit(MarkMessagesAsReadLoading());

    final result = await useCase.execute(chatId: chatId, isClient: isClient);

    result.fold(
      (failure) {
        emit(MarkMessagesAsReadFailure(failure.message));
      },
      (_) {
        emit(MarkMessagesAsReadSuccess());
      },
    );
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_messages_state.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/message_entity.dart';
import 'package:depifinalproject/feature/chat/domain/use_case/get_messages_use_case.dart';
import 'package:dartz/dartz.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  GetMessagesCubit(this.useCase) : super(GetMessagesInitial());

  final GetMessagesUseCase useCase;

  StreamSubscription<Either<Failure, List<MessageEntity>>>? _subscription;

  void getMessages({required String chatId}) {
    emit(GetMessagesLoading());

    _subscription?.cancel();

    _subscription = useCase.execute(chatId: chatId).listen((result) {
      result.fold(
        (failure) {
          emit(GetMessagesFailure(failure.message));
        },
        (messages) {
          emit(GetMessagesSuccess(messages));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

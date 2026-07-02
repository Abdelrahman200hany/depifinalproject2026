import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_user_chats_state.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/chat/domain/entity/chat_entity.dart';
import 'package:depifinalproject/feature/chat/domain/use_case/get_user_chats_use_case.dart';
import 'package:dartz/dartz.dart';

class GetUserChatsCubit extends Cubit<GetUserChatsState> {
  GetUserChatsCubit(this.useCase) : super(GetUserChatsInitial());

  final GetUserChatsUseCase useCase;

  StreamSubscription<Either<Failure, List<ChatEntity>>>? _subscription;

  void getChats({required String userId}) {
    emit(GetUserChatsLoading());

    _subscription?.cancel();

    _subscription = useCase.execute(userId: userId).listen((result) {
      result.fold(
        (failure) {
          emit(GetUserChatsFailure(failure.message));
        },
        (chats) {
          emit(GetUserChatsSuccess(chats));
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

import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final UserEntity user;

  UpdateUserSuccess({required this.user});
}

class UpdateUserFailure extends UpdateUserState {
  final String message;

  UpdateUserFailure({required this.message});
}

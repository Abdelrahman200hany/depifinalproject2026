part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFaulire extends SignUpState {
  final String errorMessage;

  SignUpFaulire({required this.errorMessage});
}

final class SignUpSuccess extends SignUpState {

  final UserEntity user;

  SignUpSuccess({required this.user});
  
}

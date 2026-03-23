part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInloading extends SignInState {}

final class SignInfaulire extends SignInState {
  final String errorMessage;

  SignInfaulire({required this.errorMessage});
}

final class SignInSuccess extends SignInState {
  final UserEntity user;

  SignInSuccess({required this.user});
}

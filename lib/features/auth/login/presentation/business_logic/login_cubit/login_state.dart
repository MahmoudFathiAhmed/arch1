part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccess({
    required this.loginResponse,
  });

  @override
  List<Object> get props => [loginResponse];
}

class LoginError extends LoginState {
  final String error;

  const LoginError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

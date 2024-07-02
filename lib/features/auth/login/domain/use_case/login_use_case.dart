
import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/auth/login/data/models/login_response.dart';
import 'package:arch1/features/auth/login/domain/repository/base_login_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase extends BaseUseCase<LoginResponse, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);

  @override
  Future<(Failure?, LoginResponse?)> call(LoginParameters parameters) {
    return baseLoginRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email,password];
}
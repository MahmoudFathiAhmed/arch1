
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/auth/login/data/models/login_response.dart';
import 'package:arch1/features/auth/login/domain/use_case/login_use_case.dart';

abstract class BaseLoginRepository{
  Future <(Failure?, LoginResponse?)> login(LoginParameters parameters);
}
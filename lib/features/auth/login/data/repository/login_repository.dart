
import 'package:arch1/core/error/error_handler.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/auth/login/data/datasource/remote/login_remote_data_source.dart';
import 'package:arch1/features/auth/login/data/models/login_response.dart';
import 'package:arch1/features/auth/login/domain/repository/base_login_repository.dart';
import 'package:arch1/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:dio/dio.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<(Failure?, LoginResponse?)> login(LoginParameters parameters) async {
    try {
      final result = await baseLoginRemoteDataSource.login(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (
      ErrorHandler.handle(error).failure,
      null
      ); // Failure, return null LoginResponse
    }
  }
}

import 'package:arch1/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:arch1/core/network/make_api_call.dart';
import 'package:arch1/core/network/network_constants.dart';
import 'package:arch1/features/auth/login/data/models/login_response.dart';
import 'package:arch1/features/auth/login/domain/use_case/login_use_case.dart';

abstract class BaseLoginRemoteDataSource extends BaseAppRemoteDataSource {
  Future<LoginResponse> login(LoginParameters parameters);

}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<LoginResponse> login(LoginParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.login}}',
        method: HttpMethod.post,
        fromJson: (data) =>
            LoginResponse.fromJson(data));
  }
}

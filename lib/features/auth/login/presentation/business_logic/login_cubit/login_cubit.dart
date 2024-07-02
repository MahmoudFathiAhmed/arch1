import 'package:arch1/core/helpers/app_preferences.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/features/auth/login/data/models/login_response.dart';
import 'package:arch1/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginLoading());
    final result = await loginUseCase(LoginParameters(
        email: emailController.text, password: passwordController.text));
    if (result.$1 != null) {
      emit(LoginError(error: result.$1!.message));
    } else {
      await getIt.get<AppPreferences>().setSecuredString(userToken, result.$2!.token??'');
      emit(LoginSuccess(loginResponse: result.$2!));
    }
  }
}

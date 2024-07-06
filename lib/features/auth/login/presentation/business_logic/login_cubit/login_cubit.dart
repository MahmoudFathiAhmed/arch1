import 'package:arch1/features/auth/login/export/login_export.dart';


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

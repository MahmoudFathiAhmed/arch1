import 'package:arch1/core/shared_widgets/custom_input_field.dart';
import 'package:arch1/features/auth/login/presentation/business_logic/password_visibility_%20cubit/password_visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PasswordInputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hint;
  final TextEditingController? controller;
  const PasswordInputField({super.key, this.validator, this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PasswordVisibilityCubit(),
        child: BlocBuilder<PasswordVisibilityCubit, bool>(
          builder: (passwordVisibilityContext, state) {
            return CustomInputField(
              controller: controller,
              validator: validator,
              hint: hint,
              textInputType: TextInputType.visiblePassword,
              obscureText: passwordVisibilityContext
                  .select((PasswordVisibilityCubit cubit) => !cubit.state),
              suffixIcon: IconButton(
                  onPressed: () {
                    passwordVisibilityContext
                        .read<PasswordVisibilityCubit>()
                        .toggleVisibility();
                  },
                  icon: Icon(passwordVisibilityContext.select(
                          (PasswordVisibilityCubit cubit) => cubit.state
                          ? Icons.visibility_off
                          : Icons.visibility))),
            );
          },
        ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? textInputType;
  final String? hint;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final double textFontSize;
  final Color textColor;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  const CustomInputField(
      {Key? key,
        this.controller,
        this.validator,
        this.obscureText = false,
        this.textInputType,
        this.suffixIcon,
        required this.hint,
        this.readOnly = false,
        this.enabled = true,
        this.onChanged,
        this.focusNode,
        this.textFontSize = 14,
        this.textColor = Colors.black,
        this.errorText,
        this.prefixIcon,
        this.prefixIconConstraints,
        this.inputFormatters,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black,
      validator: validator,
      controller: controller,
      enabled: enabled,
      keyboardType: textInputType,
      obscureText: obscureText,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      // style: TextStyle(),
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        hintText: hint,
        suffixIcon: suffixIcon,
        // hintStyle: ,
        // fillColor: ,
        // filled: ,
        // border: ,
        // enabledBorder: ,
        // focusedBorder: ,
        // errorBorder: ,
        // focusedErrorBorder: ,
        // disabledBorder: ,
      ),
    );
  }
}
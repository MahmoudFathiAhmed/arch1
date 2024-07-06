import 'package:arch1/core/utils/colors_manager.dart';
import 'package:arch1/core/utils/font_manager.dart';
import 'package:arch1/core/utils/styles_manager.dart';
import 'package:arch1/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorsManager.redPrimary,
    scaffoldBackgroundColor: ColorsManager.blackBg,
    useMaterial3: true,
    //app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorsManager.blackBg,
            statusBarIconBrightness: Brightness.light),
        color: ColorsManager.blackBg,
        // shadowColor: ColorsManager.lightPrimary,
        elevation: AppDouble.d0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorsManager.white),
        titleTextStyle:
            getMediumStyle(color: ColorsManager.white, fontSize: FontSize.s18)),
    //button theme
    buttonTheme: const ButtonThemeData(
      disabledColor: ColorsManager.disabledPrimaryRedColor,
      buttonColor: ColorsManager.redPrimary,
      splashColor: ColorsManager.white,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppDouble.d10),
          textStyle:
              getBoldStyle(color: ColorsManager.white, fontSize: FontSize.s22),
          backgroundColor: ColorsManager.redPrimary,
          foregroundColor: ColorsManager.white,
          disabledBackgroundColor: ColorsManager.disabledPrimaryRedColor,
          disabledForegroundColor: ColorsManager.white,
          // fixedSize: const Size(double.infinity,55 ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDouble.d8))),
    ),
    //popup theme
    popupMenuTheme: const PopupMenuThemeData(
      color: ColorsManager.blackBg,
      shadowColor: ColorsManager.popShadowColor,
      surfaceTintColor: ColorsManager.blackBg,
    ),
    dialogBackgroundColor: ColorsManager.blackBg,
    dialogTheme: DialogTheme(
      backgroundColor: ColorsManager.blackBg,
      surfaceTintColor: ColorsManager.blackBg,
      shadowColor: ColorsManager.popShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDouble.d4),
      ),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(color: ColorsManager.white, fontSize: FontSize.s36),
      labelLarge:
          getBoldStyle(color: ColorsManager.white, fontSize: FontSize.s28),
      bodyLarge: getBoldStyle(
        color: ColorsManager.white,
        fontSize: FontSize.s22,
      ),
      headlineLarge: getBoldStyle(
        color: ColorsManager.white,
        fontSize: FontSize.s18,
      ),
      titleLarge:
          getSemiBoldStyle(color: ColorsManager.white, fontSize: FontSize.s14),
      displayMedium: getMediumStyle(
        color: ColorsManager.white,
        fontSize: FontSize.s18,
      ),
      displaySmall:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s18),
      bodySmall:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s15),
      titleSmall: getLightStyle(
          color: ColorsManager.errorColor, fontSize: FontSize.s12),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
          getRegularStyle(color: ColorsManager.white, fontSize: FontSize.s13)),
    )),
    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: getRegularStyle(
            color: ColorsManager.white70, fontSize: FontSize.s15),
        contentPadding: const EdgeInsets.all(16),
        errorStyle: getLightStyle(
          color: ColorsManager.errorColor,
          fontSize: FontSize.s12,
        ),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.borderTextFieldDark, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d4))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.borderTextFieldDark, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d4))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.errorColor, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d4))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.borderTextFieldDark, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d4))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.borderTextFieldDark, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d4)))),
  );
}

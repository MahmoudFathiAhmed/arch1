import 'package:arch1/core/utils/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationHelper {
  /// get the text direction either LTR or RTL
  static TextDirection getDirection(BuildContext context) =>
      context.deviceLocale.languageCode == StringsManager.en
          ? TextDirection.LTR
          : TextDirection.RTL;

  ///change language
  static Future<void> changeLanguage(BuildContext context) async =>
      await context.setLocale(Locale(
          context.locale.languageCode == StringsManager.en
              ? StringsManager.ar
              : StringsManager.en));

  ///change to Arabic
  static Future<void> changeToArabic(BuildContext context) async =>
      await context.setLocale(const Locale(StringsManager.ar));

  ///change to english
  static Future<void> changeToEnglish(BuildContext context) async =>
      await context.setLocale(const Locale(StringsManager.en));

  /// get the text direction either LTR or RTL
  static String getLanguageCode(BuildContext context) =>
      context.deviceLocale.languageCode;
}

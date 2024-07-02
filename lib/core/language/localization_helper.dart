import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationHelper {
  /// get the text direction either LTR or RTL
  static TextDirection getDirection(BuildContext context) =>
      context.deviceLocale.languageCode == 'en'
          ? TextDirection.LTR
          : TextDirection.RTL;

  ///change language
  static Future<void> changeLanguage(BuildContext context) async=>await context
      .setLocale(Locale(context.locale.languageCode == 'en' ? 'ar' : 'en'));

  ///change to Arabic
  static Future<void> changeToArabic(BuildContext context) async=> await context
      .setLocale(const Locale('ar'));

  ///change to english
  static Future<void> changeToEnglish(BuildContext context) async => await context
      .setLocale(const Locale('en'));
  /// get the text direction either LTR or RTL
  static String getLanguageCode(BuildContext context) =>
      context.deviceLocale.languageCode;

}
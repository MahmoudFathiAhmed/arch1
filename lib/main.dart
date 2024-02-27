import 'package:arch1/app/app_name.dart';
import 'package:arch1/core/language/language.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ServicesLocator().init();
  runApp(EasyLocalization(
      supportedLocales: const [
        arabicLocale,englishLocale],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: localizationPath,
      child: MyApp()));
}
import 'package:arch1/app/app_name.dart';
import 'package:arch1/core/language/language.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/core/utils/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//replace on word to another in all app run this in command line
//find . -type f -name "*.dart" -exec sed -i '' 's/arch1/arch1/g' {} \;
//find . -type f -name "*.dart" -exec sed -i '' 's/arch1/arch1/g' {} \;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  ServicesLocator().init();
  runApp(EasyLocalization(
      supportedLocales: const [englishLocale, arabicLocale],
      fallbackLocale: const Locale(StringsManager.en),
      startLocale: const Locale(StringsManager.en),
      path: localizationPath,
      child: MyApp()));
}

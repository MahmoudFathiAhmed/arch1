
import 'package:arch1/core/extensions/extenstions.dart';
import 'package:arch1/core/helpers/app_preferences.dart';
import 'package:arch1/core/routes/routes_manager.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/core/utils/themes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();


  @override
  void didChangeDependencies() async {
    _appPreferences.getLocale().then((locale) => context.setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.pixelToDp(1290), context.pixelToDp(2796)),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child)=> MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'AppName',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.initialRoute,
      ),
    );
  }
}
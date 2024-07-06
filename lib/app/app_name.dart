import 'package:arch1/app/app_export.dart';

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
        designSize: Size(context.pixelToDp(AppConstants.appWidthPixels),
            context.pixelToDp(AppConstants.appHeightPixels)),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => BlocProvider(
              create: (context) => BottomNavigationCubit(),
              child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: StringsManager.appName,
                debugShowCheckedModeBanner: false,
                theme: getApplicationTheme(),
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.initialRoute,
              ),
            ));
  }
}

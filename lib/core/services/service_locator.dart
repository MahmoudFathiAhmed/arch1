import 'package:arch1/core/helpers/app_preferences.dart';
import 'package:arch1/core/network/dio_factory.dart';
import 'package:arch1/core/network/network_info.dart';
import 'package:arch1/modules/start/data/datasource/remote/start_remote_data_source.dart';
import 'package:arch1/modules/start/data/repository/start_repository.dart';
import 'package:arch1/modules/start/domain/repository/base_start_repository.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';
import 'package:arch1/modules/start/domain/use_case/get_posts_use_case.dart';
import 'package:arch1/modules/start/presentation/business_logic/get_a_post_bloc/get_a_post_bloc.dart';
import 'package:arch1/modules/start/presentation/business_logic/get_posts_bloc/get_posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///Dio Factory
    getIt.registerLazySingleton<DioFactory>(() => DioFactory(getIt()));

    ///App Preferences
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    ///Shared Preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerFactory<SharedPreferences>(() => sharedPreferences);

    /// Network info
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    /// Network Connection checker
    getIt.registerLazySingleton<InternetConnectionChecker>(
            () => InternetConnectionChecker());

    /// USE CASES
    getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAPostUseCase(getIt()));

    /// REPOSITORIES
    getIt.registerLazySingleton<BaseStartRepository>(
            () => StartRepository(getIt()));

    ///DATA SOURCES
    getIt.registerLazySingleton<BaseStartRemoteDataSource>(
            () => StartRemoteDataSource());

    /// BLOCS
    getIt.registerFactory(() => GetPostsBloc(getIt(),));
    getIt.registerFactory(() => GetAPostBloc(getIt(),));



  }
}
import 'package:arch1/core/network/dio_factory.dart';
import 'package:arch1/core/services/service_locator.dart';

abstract class BaseAppRemoteDataSource{
  late DioFactory dio;

  BaseAppRemoteDataSource(){
    dio=getIt.get<DioFactory>();
  }
}
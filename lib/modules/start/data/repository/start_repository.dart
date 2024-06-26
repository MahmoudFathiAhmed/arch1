import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/error_handler.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/modules/start/data/datasource/remote/start_remote_data_source.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/repository/base_start_repository.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';
import 'package:dio/dio.dart';

class StartRepository extends BaseStartRepository {
  final BaseStartRemoteDataSource baseStartRemoteDataSource;

  StartRepository(this.baseStartRemoteDataSource);

  @override
  Future<(Failure?, Post?)> getAPost(GetAPostParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.getAPost(parameters);
      return (null, result); // Success - No Failure, return result
    } on DioException catch (error) {
      return (
        ErrorHandler.handle(error).failure,
        null
      ); // Failure, return null Post
    }
  }

  @override
  Future<(Failure?, List<Post>?)> getPosts(NoParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.getPosts(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}

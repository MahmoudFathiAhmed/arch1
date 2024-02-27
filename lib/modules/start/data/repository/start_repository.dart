import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/error_handler.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/modules/start/data/datasource/remote/start_remote_data_source.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/repository/base_start_repository.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StartRepository extends BaseStartRepository {
  final BaseStartRemoteDataSource baseStartRemoteDataSource;

  StartRepository(this.baseStartRemoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts(NoParameters parameters) async {
    final result = await baseStartRemoteDataSource.getPosts(parameters);
    try {
      return Right(result);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, Post>> getAPost(GetAPostParameters parameters) async{
    final result = await baseStartRemoteDataSource.getAPost(parameters);
    try {
      return Right(result);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }


}
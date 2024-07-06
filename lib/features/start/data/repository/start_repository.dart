import 'package:arch1/features/start/export/start_export.dart';

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
  Future<(Failure?, List<Post>?)> getPosts(
      GetPostsParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.getPosts(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}

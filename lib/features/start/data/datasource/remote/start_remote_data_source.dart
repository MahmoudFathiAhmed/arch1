import 'package:arch1/features/start/export/start_export.dart';

abstract class BaseStartRemoteDataSource extends BaseAppRemoteDataSource {
  Future<List<Post>> getPosts(GetPostsParameters parameters);

  Future<Post> getAPost(GetAPostParameters parameters);
}

class StartRemoteDataSource extends BaseStartRemoteDataSource {
  @override
  Future<Post> getAPost(GetAPostParameters parameters) async{
    return await makeApiCall(
        url: '${NetworkConstants.getAPost}/${parameters.id}',
        method: HttpMethod.get,
        fromJson: (data) =>
            Post.fromJson(data));
  }

  @override
  Future<List<Post>> getPosts(GetPostsParameters parameters) async{

    return await makeApiCall(
        url: NetworkConstants.getPosts,
        method: HttpMethod.get,
        queryParams: {
          '_start':parameters.startIndex,
          '_limit':parameters.limit,
        },
        fromJson: (data) =>
            data.map<Post>((post) => Post.fromJson(post)).toList());
  }
}

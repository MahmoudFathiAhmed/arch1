import 'package:arch1/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:arch1/core/network/make_api_call.dart';
import 'package:arch1/core/network/network_constants.dart';
import 'package:arch1/features/start/data/models/post.dart';
import 'package:arch1/features/start/domain/use_case/get_a_post_use_case.dart';
import 'package:arch1/features/start/domain/use_case/get_posts_use_case.dart';

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

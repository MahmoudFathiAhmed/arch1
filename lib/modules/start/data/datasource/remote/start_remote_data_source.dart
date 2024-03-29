import 'package:arch1/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/network/make_api_call.dart';
import 'package:arch1/core/network/network_constants.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';

abstract class BaseStartRemoteDataSource extends BaseAppRemoteDataSource {
  Future<List<Post>> getPosts(NoParameters parameters);

  Future<Post> getAPost(GetAPostParameters parameters);
}

class StartRemoteDataSource extends BaseStartRemoteDataSource {
  @override
  Future<List<Post>> getPosts(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.getPosts,
        method: HttpMethod.get,
        fromJson: (data) =>
            data.map<Post>((post) => Post.fromJson(post)).toList());
    // final d = await dio.getDio();
    // final response = await d.get(NetworkConstants.getPosts);
    // if (response.statusCode == AppInt.i200) {
    //   return response.data.map<Post>((post) => Post.fromJson(post)).toList();
    // } else {
    //   throw Failure(ApiInternalStatus.failure, ResponseMessage.unKnown);
    // }
  }

  @override
  Future<Post> getAPost(GetAPostParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.getAPost}/${parameters.id}',
        method: HttpMethod.get,
        fromJson: (data) =>
            Post.fromJson(data));
  }
}
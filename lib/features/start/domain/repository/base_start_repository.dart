import 'package:arch1/features/start/export/start_export.dart';

abstract class BaseStartRepository{
  Future <(Failure?, List<Post>?)> getPosts(GetPostsParameters parameters);
  Future <(Failure?, Post?)> getAPost(GetAPostParameters parameters);
}
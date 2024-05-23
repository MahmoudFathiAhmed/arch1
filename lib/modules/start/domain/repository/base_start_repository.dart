import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';

abstract class BaseStartRepository{
  Future <(Failure?, List<Post>?)> getPosts(NoParameters parameters);
  Future <(Failure?, Post?)> getAPost(GetAPostParameters parameters);
}
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/start/data/models/post.dart';
import 'package:arch1/features/start/domain/use_case/get_a_post_use_case.dart';
import 'package:arch1/features/start/domain/use_case/get_posts_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

abstract class BaseStartRepository{
  Future <(Failure?, List<Post>?)> getPosts(GetPostsParameters parameters);
  Future <(Failure?, Post?)> getAPost(GetAPostParameters parameters);
}
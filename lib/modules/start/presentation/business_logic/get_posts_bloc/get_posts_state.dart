part of 'get_posts_bloc.dart';

abstract class GetPostsState extends Equatable {
  const GetPostsState();
}
class GetPostsInitial extends GetPostsState {
  @override
  List<Object> get props => [];
}
class GetPostsLoading extends GetPostsState {
  @override
  List<Object> get props => [];
}

class GetPostsSuccess extends GetPostsState {
  final List<Post> posts;

  const GetPostsSuccess({
    required this.posts,
  });

  @override
  List<Object> get props => [posts];
}


class GetPostsError extends GetPostsState {
  final String error;

  const GetPostsError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}


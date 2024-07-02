part of 'get_a_post_bloc.dart';

sealed class GetAPostState extends Equatable {
  const GetAPostState();
}

class GetAPostInitial extends GetAPostState {
  @override
  List<Object> get props => [];
}


class GetAPostLoading extends GetAPostState {
  @override
  List<Object> get props => [];
}

class GetAPostSuccess extends GetAPostState {
  final Post post;

  const GetAPostSuccess({
    required this.post,
  });

  @override
  List<Object> get props => [post];
}


class GetAPostError extends GetAPostState {
  final String error;

  const GetAPostError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
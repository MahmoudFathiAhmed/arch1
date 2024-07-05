part of 'get_posts_bloc.dart';

class GetPostsEvent extends Equatable {
  final int startIndex;
  final int limit;
  const GetPostsEvent({required this.startIndex, required this.limit});

  @override
  List<Object> get props => [startIndex, limit];
}

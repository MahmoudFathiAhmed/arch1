import 'package:arch1/features/start/export/start_export.dart';

class GetPostsUseCase extends BaseUseCase<List<Post>, GetPostsParameters> {
  final BaseStartRepository baseStartRepository;

  GetPostsUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Post>?)> call(GetPostsParameters parameters) async {
    return await baseStartRepository.getPosts(parameters);
  }
}

class GetPostsParameters extends Equatable {
  final int startIndex;
  final int limit;

  const GetPostsParameters({required this.startIndex, required this.limit});

  @override
  List<Object> get props => [startIndex, limit];
}

import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/start/data/models/post.dart';
import 'package:arch1/features/start/domain/repository/base_start_repository.dart';
import 'package:equatable/equatable.dart';

class GetPostsUseCase extends BaseUseCase<List<Post>, GetPostsParameters> {
  final BaseStartRepository baseStartRepository;

  GetPostsUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Post>?)> call(GetPostsParameters parameters) async {
    return await baseStartRepository.getPosts(parameters);
  }
}
class GetPostsParameters extends Equatable{
  final int startIndex;
  final int limit;
  const GetPostsParameters({ this.startIndex=0, this.limit=12});
  @override
  List<Object> get props => [startIndex,limit];
}
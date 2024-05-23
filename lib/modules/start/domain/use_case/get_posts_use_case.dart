import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/repository/base_start_repository.dart';

class GetPostsUseCase extends BaseUseCase<List<Post>, NoParameters> {
  final BaseStartRepository baseStartRepository;

  GetPostsUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Post>?)> call(NoParameters parameters) async {
    return await baseStartRepository.getPosts(parameters);
  }
}

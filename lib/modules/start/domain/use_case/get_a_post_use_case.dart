import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/repository/base_start_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAPostUseCase extends BaseUseCase <Post, GetAPostParameters> {
  final BaseStartRepository baseStartRepository;

  GetAPostUseCase(this.baseStartRepository);

  @override
  Future<Either<Failure, Post>> call(
      GetAPostParameters parameters) async {
    return await baseStartRepository.getAPost(parameters);
  }

}

class GetAPostParameters extends Equatable {
  final int id;

  const GetAPostParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
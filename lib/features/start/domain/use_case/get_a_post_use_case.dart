import 'package:arch1/features/start/export/start_export.dart';

class GetAPostUseCase extends BaseUseCase<Post, GetAPostParameters> {
  final BaseStartRepository baseStartRepository;

  GetAPostUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, Post?)> call(GetAPostParameters parameters) {
    return baseStartRepository.getAPost(parameters);
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

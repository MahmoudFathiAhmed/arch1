import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/core/error/failure.dart';
import 'package:arch1/features/start/data/models/post.dart';
import 'package:arch1/features/start/domain/repository/base_start_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

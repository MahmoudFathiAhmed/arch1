import 'dart:async';

import 'package:arch1/core/base_use_case/base_use_case.dart';
import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/use_case/get_posts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  GetPostsUseCase getPostsUseCase;
  GetPostsBloc(this.getPostsUseCase) : super(GetPostsInitial()) {
    on<GetPostsEvent>(_getPosts);
  }

  FutureOr<void> _getPosts(GetPostsEvent event, Emitter<GetPostsState> emit) async{
    emit(GetPostsLoading());
    final result = await getPostsUseCase(const NoParameters());
    result.fold((l) => emit(GetPostsError(error: l.message)), (r) => emit(GetPostsSuccess(posts: r)));
  }
}

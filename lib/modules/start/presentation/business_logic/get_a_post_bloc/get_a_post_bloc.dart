import 'dart:async';

import 'package:arch1/modules/start/data/models/post.dart';
import 'package:arch1/modules/start/domain/use_case/get_a_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_a_post_event.dart';
part 'get_a_post_state.dart';

class GetAPostBloc extends Bloc<GetAPostEvent, GetAPostState> {
  GetAPostUseCase getAPostUseCase;

  GetAPostBloc(this.getAPostUseCase) : super(GetAPostInitial()) {
    on<GetAPostEvent>(getAPost);
  }



  FutureOr<void> getAPost(GetAPostEvent event, Emitter<GetAPostState> emit) async{
emit(GetAPostLoading());
    final result = await getAPostUseCase(GetAPostParameters(id: event.id));
    result.fold((l) => emit(GetAPostError(error: l.message)), (r) => emit(GetAPostSuccess(post: r)));
  }
}

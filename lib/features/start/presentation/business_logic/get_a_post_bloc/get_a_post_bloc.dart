import 'package:arch1/features/start/export/start_export.dart';

part 'get_a_post_event.dart';

part 'get_a_post_state.dart';

class GetAPostBloc extends Bloc<GetAPostEvent, GetAPostState> {
  GetAPostUseCase getAPostUseCase;

  GetAPostBloc(this.getAPostUseCase) : super(GetAPostInitial()) {
    on<GetAPostEvent>(getAPost);
  }

  FutureOr<void> getAPost(
      GetAPostEvent event, Emitter<GetAPostState> emit) async {
    emit(GetAPostLoading());
    final result = await getAPostUseCase(GetAPostParameters(id: event.id));
    if (result.$1 != null) {
      emit(GetAPostError(error: result.$1!.message));
    } else {
      emit(GetAPostSuccess(post: result.$2!));
    }
  }
}

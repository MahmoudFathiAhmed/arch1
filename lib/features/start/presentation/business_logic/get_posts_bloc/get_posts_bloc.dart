import 'package:arch1/features/start/export/start_export.dart';

part 'get_posts_event.dart';

part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  GetPostsUseCase getPostsUseCase;

  GetPostsBloc(this.getPostsUseCase) : super(GetPostsInitial()) {
    on<GetPostsEvent>(_getPosts);
  }

  FutureOr<void> _getPosts(
      GetPostsEvent event, Emitter<GetPostsState> emit) async {
    emit(GetPostsLoading());
    final result = await getPostsUseCase(
        GetPostsParameters(startIndex: event.startIndex, limit: event.limit));
    if (result.$1 != null) {
      emit(GetPostsError(error: result.$1!.message));
    } else {
      emit(GetPostsSuccess(posts: result.$2!));
    }
  }
}

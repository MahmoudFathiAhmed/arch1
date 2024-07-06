import 'package:arch1/features/start/export/start_export.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostsBloc(getIt.get()),
      child: const StartScreenContent(),
    );
  }
}

class StartScreenContent extends StatefulWidget {
  const StartScreenContent({super.key});

  @override
  State<StartScreenContent> createState() => _StartScreenContentState();
}

class _StartScreenContentState extends State<StartScreenContent> {
  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<GetPostsBloc>().add(GetPostsEvent(
          startIndex: pageKey, limit: 20)); // Adjust limit as needed
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewWidget(
      hasRefresh: true,
      onRefreshListener: () async {
        _pagingController.refresh();
        return true;
      },
      body: BlocListener<GetPostsBloc, GetPostsState>(
        listener: (context, state) {
          if (state is GetPostsSuccess) {
            final isLastPage =
                state.posts.length < AppInt.i20; // Adjust the page size accordingly
            if (isLastPage) {
              _pagingController.appendLastPage(state.posts);
            } else {
              final nextPageKey = (_pagingController.nextPageKey ?? AppInt.i1) + AppInt.i20;
              _pagingController.appendPage(state.posts, nextPageKey);
            }
          } else if (state is GetPostsError) {
            _pagingController.error = state.error;
          }
        },
        child: PaginatedListView<Post>(
          pagingController: _pagingController,
          cellAspectRatio: AppDouble.d5,
          cellWidth: context.width,
          isShimmerLoading: true,
          itemBuilder: (item, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDouble.d5, horizontal: AppDouble.d10),
              child: BlocProvider(
                create: (context) => GetAPostBloc(getIt.get()),
                child: BlocConsumer<GetAPostBloc, GetAPostState>(
                  listener: (getAPostContext, getAPostState) {
                    if (getAPostState is GetAPostSuccess) {
                      appAdaptiveDialog(
                        context,
                        bgColor: ColorsManager.white,
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close')),
                          TextButton(onPressed: () {}, child: const Text('OK')),
                        ],
                        title: Text(
                          getAPostState.post.title ?? StringsManager.emptyString,
                        ),
                        content: Text(
                          getAPostState.post.body ?? StringsManager.emptyString,
                        ),
                      );
                    }
                    if (getAPostState is GetAPostError) {
                      appErrorDialog(context, getAPostState.error);
                    }
                  },
                  builder: (getAPostContext, getAPostState) {
                    return getAPostState is GetAPostLoading
                        ? const AppLoadingWidget()
                        : ElevatedButton(
                            onPressed: () {
                              getAPostContext
                                  .read<GetAPostBloc>()
                                  .add(GetAPostEvent(id: item.id ?? AppInt.i0));
                            },
                            child: Text(
                              item.title ?? StringsManager.emptyString,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          );
                  },
                ),
              ),
            );
          },
          emptyViewButtonClickListener: () async {
            _pagingController.refresh();
            return true;
          },
          viewOrientation:
              ViewOrientation.orientationVertical, // Adjust as needed
        ),
      ),
    );
  }
}

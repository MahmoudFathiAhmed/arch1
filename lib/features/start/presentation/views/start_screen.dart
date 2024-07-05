import 'package:arch1/core/extensions/extenstions.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:arch1/core/shared_widgets/app_loading_widget.dart';
import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/error_widget.dart';
import 'package:arch1/core/shared_widgets/paginated_list_view.dart';
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:arch1/core/utils/enum.dart';
import 'package:arch1/features/start/data/models/post.dart';
import 'package:arch1/features/start/presentation/business_logic/get_a_post_bloc/get_a_post_bloc.dart';
import 'package:arch1/features/start/presentation/business_logic/get_posts_bloc/get_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
                state.posts.length < 20; // Adjust the page size accordingly
            if (isLastPage) {
              _pagingController.appendLastPage(state.posts);
            } else {
              final nextPageKey = (_pagingController.nextPageKey ?? 1) + 20;
              _pagingController.appendPage(state.posts, nextPageKey);
            }
          } else if (state is GetPostsError) {
            _pagingController.error = state.error;
          }
        },
        child: PaginatedListView<Post>(
          pagingController: _pagingController,
          cellAspectRatio: 5,
          cellWidth: context.width,
          isShimmerLoading: true,
          itemBuilder: (item, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
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
                          getAPostState.post.title ?? '',
                        ),
                        content: Text(
                          getAPostState.post.body ?? '',
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
                                  .add(GetAPostEvent(id: item.id ?? 0));
                            },
                            child: Text(
                              item.title ?? '',
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

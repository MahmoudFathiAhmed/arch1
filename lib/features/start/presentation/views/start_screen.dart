import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:arch1/core/shared_widgets/app_loading_widget.dart';
import 'package:arch1/core/shared_widgets/base_view_widget.dart';
import 'package:arch1/core/shared_widgets/error_widget.dart';
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:arch1/features/start/presentation/business_logic/get_a_post_bloc/get_a_post_bloc.dart';
import 'package:arch1/features/start/presentation/business_logic/get_posts_bloc/get_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('## x');
    return BlocProvider(
      create: (context) =>
      GetPostsBloc(getIt.get())..add(const GetPostsEvent()),
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

  @override
  Widget build(BuildContext context) {
    print('## y');
    return BaseViewWidget(
      hasRefresh: true,
      onRefreshListener: ()async{
        context.read<GetPostsBloc>().add(const GetPostsEvent());
        return true;
      },
      body: BlocBuilder<GetPostsBloc, GetPostsState>(
        builder: (getPostsContext, getPostsState) {
          if (getPostsState is GetPostsLoading) {
            return const AppLoadingWidget();
          }
          if (getPostsState is GetPostsError) {
            return AppErrorWidget(description: getPostsState.error);
          }
          if (getPostsState is GetPostsSuccess) {
            return ListView(
                children: List.generate(
                    getPostsState.posts.length,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
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
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('OK')),
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
                                    .add(GetAPostEvent(
                                    id: getPostsState
                                        .posts[index].id ??
                                        0));
                              },
                              child: Text(
                                getPostsState.posts[index].title ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium,
                              ),
                            );
                          },
                        ),
                      ),
                    )));
          } else {
            return const AppLoadingWidget();
          }
        },
      ),
    );
  }
}



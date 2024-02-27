import 'package:arch1/core/routes/routes_manager.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:arch1/modules/start/presentation/business_logic/get_a_post_bloc/get_a_post_bloc.dart';
import 'package:arch1/modules/start/presentation/business_logic/get_posts_bloc/get_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            GetPostsBloc(getIt.get())..add(const GetPostsEvent()),
        child: BlocBuilder<GetPostsBloc, GetPostsState>(
          builder: (getPostsContext, getPostsState) {
            if (getPostsState is GetPostsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (getPostsState is GetPostsError) {
              return Center(
                child: Text(getPostsState.error),
              );
            }
            if (getPostsState is GetPostsSuccess) {
              return ListView(
                  children: List.generate(
                      getPostsState.posts.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                        child: BlocProvider(
  create: (context) => GetAPostBloc(getIt.get()),
  child: BlocConsumer<GetAPostBloc, GetAPostState>(
  listener: (getAPostContext, getAPostState) {
    if(getAPostState is GetAPostSuccess){
      showAdaptiveDialog(context: context, builder: (context)=>AlertDialog.adaptive(
        backgroundColor: ColorsManager.white,
        title: Text(getAPostState.post.title??''),
        content: Text(getAPostState.post.body??''),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Close')),
          TextButton(onPressed: (){
          }, child: const Text('OK')),
        ],
      ),
        barrierDismissible: true,
      );
    }
  },
  builder: (getAPostContext, getAPostState) {
    return getAPostState is GetAPostLoading?const Center(child: CircularProgressIndicator()):
    ElevatedButton(
                              onPressed: () {
                                getAPostContext.read<GetAPostBloc>().add(GetAPostEvent(id: getPostsState.posts[index].id??0));
                              },
                              child: Text(
                                getPostsState.posts[index].title ?? '',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            );
  },
),
),
                      )));
            } else {
              return const Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }
}

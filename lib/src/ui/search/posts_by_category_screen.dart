import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/category_repository.dart';
import 'package:manwe/src/domain/blocs/category/category_posts_screen_cubit.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

import 'components/post_list.dart';

class PostsByCategoryScreen extends StatelessWidget {
  const PostsByCategoryScreen();

  @override
  Widget build(BuildContext context) {
    final categoryID = ModalRoute.of(context)!.settings.arguments as String;

    final categoryRepository = new CategoryRepository();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return BlocProvider(
      create: (context) =>
      CategoryPostsScreenCubit(categoryRepository: categoryRepository)..categoryPostsScreenStarted(categoryID),
      child: BlocBuilder<CategoryPostsScreenCubit, CategoryPostsScreenState>(
        builder: (context, state) {
          if (state is CategoryPostsScreenLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is CategoryPostsScreenSuccessLoad) {
            final categoryPostsScreen = state.categoryPostsScreen;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                brightness: Brightness.dark,
                title: Text(categoryPostsScreen.name),
              ),
              body: PostList(
                posts: categoryPostsScreen.postsForPreview,
              ),
            );
          } else {
            return Scaffold(
              body: ErrorScreen(),
            );
          }
        },
      ),
    );
  }
}

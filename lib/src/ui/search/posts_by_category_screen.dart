import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/category_repository.dart';
import 'package:manwe/src/domain/blocs/category/category_posts_page_cubit.dart';
import 'package:manwe/src/ui/shared/components/error_page.dart';
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
      CategoryPostsPageCubit(categoryRepository: categoryRepository)..categoryPostsPageStarted(categoryID),
      child: BlocBuilder<CategoryPostsPageCubit, CategoryPostsPageState>(
        builder: (context, state) {
          if (state is CategoryPostsPageLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is CategoryPostsPageSuccessLoad) {
            final categoryPostsPage = state.categoryPostsPage;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                brightness: Brightness.dark,
                title: Text(categoryPostsPage.name),
              ),
              body: PostList(
                posts: categoryPostsPage.postsForPreview,
              ),
            );
          } else {
            return Scaffold(
              body: ErrorPage(),
            );
          }
        },
      ),
    );
  }
}

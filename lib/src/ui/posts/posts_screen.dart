import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/home_repository.dart';
import 'package:manwe/src/domain/blocs/home/home_screen_cubit.dart';
import 'package:manwe/src/ui/posts/components/posts_section.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    final homeRepository = new HomeRepository();

    return BlocProvider(
      create: (context) => HomeScreenCubit(homeRepository: homeRepository)
        ..homeScreenStarted(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return LoadingCube();
          } else if (state is HomeSuccessLoad) {
            final servicesWithPosts = state.homeScreen.servicesWithPosts;
            return ListView.builder(
              padding: EdgeInsets.only(top: 0.0),
              scrollDirection: Axis.vertical,
              itemCount: servicesWithPosts.length,
              itemBuilder: (context, index) {
                return PostsSection(
                  serviceNameAbbreviation:
                      servicesWithPosts[index].abbreviation,
                  postsForPreview: servicesWithPosts[index].postsForPreview,
                );
              },
            );
          } else {
            return ErrorScreen();
          }
        },
      ),
    );
  }
}

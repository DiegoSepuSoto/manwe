import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/home_page_repository.dart';
import 'package:manwe/src/domain/blocs/home/home_cubit.dart';
import 'package:manwe/src/ui/posts/components/posts_section.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    final homePageRepository = new HomePageRepository();

    return BlocProvider(
      create: (context) => HomeCubit(homePageRepository: homePageRepository)
        ..homePageStarted(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Center(
              child: Text("HomeInitial"),
            );
          } else if (state is HomeLoading) {
            return Center(
              child: Text("Cargando"),
            );
          } else if (state is HomeSuccessLoad) {
            final servicesWithPosts = state.homePage.servicesWithPosts;
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
          } else if (state is HomeFailedLoad) {
            return Center(
              child: Text("Falló"),
            );
          } else {
          return Container();
          }
        },
      ),
    );
  }
}

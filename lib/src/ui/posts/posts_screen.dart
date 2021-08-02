import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/home_page_repository.dart';
import 'package:manwe/src/domain/blocs/home/home_cubit.dart';
import 'package:manwe/src/ui/posts/components/posts_section.dart';

import 'components/posts_section_pae.dart';
import 'components/posts_section_sesaes.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(homePageRepository: HomePageRepository())
        ..homePageStarted(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Container();
          } else if (state is HomeLoading) {
            return Container();
          } else if (state is HomeSuccessLoad) {
            final servicesWithPosts = state.homePage.servicesWithPosts;
            return Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: servicesWithPosts.length,
                  itemBuilder: (context, index) {
                    return PostsSection(
                      serviceNameAbbreviation:
                          servicesWithPosts[index].abbreviation,
                      postsForPreview: servicesWithPosts[index].postsForPreview,
                    );
                  }),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [PostsSectionPAE(), PostsSectionSESAES()],
              ),
            );
          }
        },
      ),
    );
  }
}

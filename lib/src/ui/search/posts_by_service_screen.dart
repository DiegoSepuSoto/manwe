import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/service_repository.dart';
import 'package:manwe/src/domain/blocs/service/service_posts_page_cubit.dart';
import 'package:manwe/src/ui/search/components/post_list.dart';
import 'package:manwe/src/ui/shared/components/error_page.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';

class PostsByServiceScreen extends StatelessWidget {
  const PostsByServiceScreen();

  @override
  Widget build(BuildContext context) {
    final serviceID = ModalRoute.of(context)!.settings.arguments as String;

    final serviceRepository = new ServiceRepository();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return BlocProvider(
      create: (context) =>
          ServicePostsPageCubit(serviceRepository: serviceRepository)
            ..servicePostsPageStarted(serviceID),
      child: BlocBuilder<ServicePostsPageCubit, ServicePostsPageState>(
        builder: (context, state) {
          if (state is ServicePostsPageLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is ServicePostsPageSuccessLoad) {
            final servicePostsPage = state.servicePostsPage;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                brightness: Brightness.dark,
                title: Text(servicePostsPage.name),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'service-page',
                            arguments: serviceID);
                      },
                      child: Icon(Icons.info),
                    ),
                  )
                ],
              ),
              body: PostList(
                posts: servicePostsPage.postsForPreview,
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

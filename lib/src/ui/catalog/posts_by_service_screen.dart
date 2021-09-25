import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/service_repository.dart';
import 'package:manwe/src/domain/blocs/service/service_posts_screen_cubit.dart';
import 'package:manwe/src/ui/catalog/components/post_list.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
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
          ServicePostsScreenCubit(serviceRepository: serviceRepository)
            ..servicePostsScreenStarted(serviceID),
      child: BlocBuilder<ServicePostsScreenCubit, ServicePostsScreenState>(
        builder: (context, state) {
          if (state is ServicePostsScreenLoading) {
            return Scaffold(
              body: LoadingCube(),
            );
          } else if (state is ServicePostsScreenSuccessLoad) {
            final servicePostsScreen = state.servicePostsScreen;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                brightness: Brightness.dark,
                title: Text(servicePostsScreen.name),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'service-screen',
                            arguments: serviceID);
                      },
                      child: Icon(Icons.info),
                    ),
                  )
                ],
              ),
              body: PostList(
                posts: servicePostsScreen.postsForPreview,
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

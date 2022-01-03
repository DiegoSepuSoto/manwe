import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manwe/src/data/repositories/post_repository.dart';
import 'package:manwe/src/domain/blocs/post/post_screen_cubit.dart';
import 'package:manwe/src/ui/posts/components/header_buttons.dart';
import 'package:manwe/src/ui/posts/components/post_categories.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/full_size_image_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:manwe/src/ui/utils/functions.dart';

class PostScreen extends StatelessWidget {
  const PostScreen();

  @override
  Widget build(BuildContext context) {
    final postID = ModalRoute.of(context)!.settings.arguments as String;

    final postScreenRepository = new PostRepository();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kPrimaryColor));

    return BlocProvider(
      create: (context) => PostScreenCubit(postScreenRepository: postScreenRepository)
        ..postScreenStarted(postID),
      child: Container(
        color: kBackgroundColor,
        child: SafeArea(
          top: false,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: BlocBuilder<PostScreenCubit, PostScreenState>(
              builder: (context, state) {
                if (state is PostScreenLoading) {
                  return LoadingCube();
                } else if (state is PostScreenSuccessLoad) {
                  final postScreen = state.postScreen;
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PostHeader(
                            postImage: postScreen.image,
                            serviceID: postScreen.serviceId,
                            serviceName: postScreen.serviceName,
                          ),
                          postScreen.categories.length > 0 ? PostCategories(
                            categories: postScreen.categories,
                          ) : Container(),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: kDefaultPadding),
                            child: Text(
                              postScreen.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(kDefaultPadding),
                            child: MarkdownBody(
                              data: postScreen.body,
                              styleSheet: buildPostMarkdownBody(),
                              onTapLink: (text, url, title) {
                                showAlertDialogToOpenLink(context, url!);
                              },
                              imageBuilder: (uri, title, alt) {
                                return Image.network(
                                  "${dotenv.env['ILUVATAR_CMS_HOST']}$uri",
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return ErrorScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String postImage;
  final String serviceID;
  final String serviceName;

  const PostHeader(
      {required this.postImage,
      required this.serviceName,
      required this.serviceID});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FullSizeImageScreen(
                        image: postImage,
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 270.0,
                width: size.width,
                child: Image.network(
                  postImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: statusBarHeight,
              width: size.width,
              color: kPrimaryColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * 3),
              child: HeaderButtons(
                serviceID: serviceID,
              ),
            ),
          ],
        ),
        ServiceHeader(serviceName: serviceName),
      ],
    );
  }
}

class ServiceHeader extends StatelessWidget {
  final String serviceName;

  const ServiceHeader({required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: kDefaultPadding),
          child: Text(
            serviceName,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: kPrimaryColor,
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}

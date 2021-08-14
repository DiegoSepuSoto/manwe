import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/post_page_repository.dart';
import 'package:manwe/src/domain/blocs/post/post_cubit.dart';
import 'package:manwe/src/ui/posts/components/header_back_button.dart';
import 'package:manwe/src/ui/posts/components/header_info_button.dart';
import 'package:manwe/src/ui/posts/components/post_categories.dart';
import 'package:manwe/src/ui/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PostPage extends StatelessWidget {
  const PostPage();

  @override
  Widget build(BuildContext context) {
    final postID = ModalRoute.of(context)!.settings.arguments as String;

    final postPageRepository = new PostPageRepository();

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kPrimaryColor));

    return BlocProvider(
      create: (context) => PostCubit(postPageRepository: postPageRepository)
        ..postPageStarted(postID),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return Container();
          } else if (state is PostLoading) {
            return Container();
          } else if (state is PostSuccessLoad) {
            final postPage = state.postPage;
            return Container(
              color: kBackgroundColor,
              child: SafeArea(
                top: false,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  body: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PostHeader(
                            postImage: postPage.image,
                            serviceName: postPage.serviceName,
                          ),
                          PostCategories(
                            categories: postPage.categories,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: kDefaultPadding),
                            child: Text(
                              postPage.title,
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
                              data: postPage.body,
                              styleSheet: MarkdownStyleSheet(
                                h1: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                p: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String postImage;
  final String serviceName;

  const PostHeader({required this.postImage, required this.serviceName});

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
                      return FullSizeImage(
                        postImage: postImage,
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
              child: HeaderButtons(),
            ),
          ],
        ),
        ServiceHeader(serviceName: serviceName),
      ],
    );
  }
}

class HeaderButtons extends StatelessWidget {
  const HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderBackButton(),
        Spacer(),
        HeaderInfoButton(
          serviceDetailsRoute: 'service-details-pae',
        ),
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

class FullSizeImage extends StatelessWidget {
  final String postImage;

  const FullSizeImage({required this.postImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            postImage,
          ),
        ),
      ),
    );
  }
}

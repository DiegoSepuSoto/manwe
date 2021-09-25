import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manwe/src/data/repositories/search_repository.dart';
import 'package:manwe/src/domain/blocs/search/posts_search_cubit.dart';
import 'package:manwe/src/ui/catalog/components/post_list.dart';
import 'package:manwe/src/ui/shared/components/error_screen.dart';
import 'package:manwe/src/ui/shared/components/loading_cube.dart';
import 'package:manwe/src/ui/shared/components/no_content_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchRepository = new SearchRepository();

  TextEditingController? _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsSearchCubit(searchRepository: searchRepository),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: TextField(
                onSubmitted: (value) {
                  BlocProvider.of<PostsSearchCubit>(context)
                      .postsSearchStarted(value);
                },
                controller: _textEditingController,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusColor: Colors.white,
                  hintText: 'Término que deseas buscar',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: BlocBuilder<PostsSearchCubit, PostsSearchState>(
              builder: (context, state) {
                if (state is PostsSearchInitial) {
                  return Center(
                    child: Text('Ingresa un término para buscar'),
                  );
                }
                if (state is PostsSearchLoading) {
                  return Scaffold(
                    body: LoadingCube(),
                  );
                } else if (state is PostsSearchSuccessLoad) {
                  final postsSearchResult = state.postsSearchResult.posts;
                  return postsSearchResult.length > 0
                      ? PostList(posts: postsSearchResult)
                      : NoContentScreen();
                } else {
                  return Scaffold(
                    body: ErrorScreen(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

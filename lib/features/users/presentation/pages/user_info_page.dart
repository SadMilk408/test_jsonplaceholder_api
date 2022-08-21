import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/user_albums/presentation/bloc/user_albums_bloc.dart';
import 'package:test_for_eclipse/features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';
import 'package:test_for_eclipse/features/users/presentation/widgets/widgets.dart';
import 'package:test_for_eclipse/injection_container.dart';

class UserInfoPage extends StatelessWidget {
  final UsersModel userInfo;

  const UserInfoPage({required this.userInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInfo.username),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserInfoWidget(userInfo: userInfo),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BlocProvider(
                      create: (context) => sl<UserPostsBloc>()
                        ..add(UserPostsLoadingEvent(userId: userInfo.id)),
                      child: PostsWidget(userInfo: userInfo),
                    ),
                  ),
                  Expanded(
                    child: BlocProvider(
                      create: (context) => sl<UserAlbumsBloc>()
                        ..add(UserAlbumsLoadingEvent(userId: userInfo.id)),
                      child: AlbumsWidget(userInfo: userInfo),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
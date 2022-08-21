import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'package:test_for_eclipse/features/user_posts/presentation/pages/user_posts_page.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  final UsersModel userInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsBloc, UserPostsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorState) {
          return Center(child: Text(state.message));
        }
        if (state is DoneState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'Posts',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                          text: state.postsList.posts[index].title,
                        ),
                      ),
                      subtitle: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          text: state.postsList.posts[index].body,
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserPostsPage(posts: state.postsList.posts),
                            )
                        );
                      },
                      child: const Text('Show all', style: TextStyle(color: Colors.white),),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/post_comments/presentation/bloc/post_comments_bloc.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostsModel post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentsBloc, PostCommentsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is DoneState) {
          return Column(
            children: [
              ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.postsList.comments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(state.postsList.comments[index].name),
                            subtitle:
                            Text(state.postsList.comments[index].email),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: Text(state.postsList.comments[index].body),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
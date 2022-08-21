import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';
import 'package:test_for_eclipse/features/post_comments/presentation/bloc/post_comments_bloc.dart';
import 'package:test_for_eclipse/features/post_comments/presentation/widgets/alert_dialog_widget.dart';
import 'package:test_for_eclipse/features/post_comments/presentation/widgets/post_widget.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';
import 'package:test_for_eclipse/injection_container.dart';

class PostCommentsPage extends StatelessWidget {
  final PostsModel post;

  const PostCommentsPage({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameEditingController = TextEditingController();
    final TextEditingController emailEditingController =
    TextEditingController();
    final TextEditingController textEditingController = TextEditingController();

    return BlocProvider(
      create: (context) => sl<PostCommentsBloc>()
        ..add(PostCommentsLoadingEvent(postId: post.id)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
        ),
        body: PostWidget(post: post),
        floatingActionButton: AddCommentButtonWidget(
          formKey: formKey,
          nameEditingController: nameEditingController,
          emailEditingController: emailEditingController,
          textEditingController: textEditingController,
          post: post,
        ),
      ),
    );
  }
}

class AddCommentButtonWidget extends StatelessWidget {
  const AddCommentButtonWidget({
    Key? key,
    required this.formKey,
    required this.nameEditingController,
    required this.emailEditingController,
    required this.textEditingController,
    required this.post,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController textEditingController;
  final PostsModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: MaterialButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialogWidget(
                  title: 'Add new comment',
                  additionalContent: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: nameEditingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              labelText: 'Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: emailEditingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              labelText: 'Comment text',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Send'),
                    )
                  ],
                ),
          ).then(
                (value) {
              context.read<PostCommentsBloc>().add(
                SendNewCommentEvent(
                  commentsModel: CommentsModel(
                    postId: post.id,
                    name: nameEditingController.text,
                    email: emailEditingController.text,
                    body: textEditingController.text,
                    id: 0,
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          width: double.infinity,
          height: 60,
          child: const Center(
            child: Text(
              'Add comment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

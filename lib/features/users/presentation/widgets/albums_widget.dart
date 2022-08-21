import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/user_albums/presentation/bloc/user_albums_bloc.dart';
import 'package:test_for_eclipse/features/user_albums/presentation/pages/user_albums_page.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

class AlbumsWidget extends StatelessWidget {
  const AlbumsWidget({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  final UsersModel userInfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAlbumsBloc, UserAlbumsState>(
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
                const Text(
                  'Albums',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        color: Colors.blueGrey,
                        child: const Center(
                          child: Text(
                            '30x30',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                      title: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16.0),
                          text: state.albumsList.albums[index].title,
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
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserAlbums(userAlbums: state.albumsList.albums),
                            )
                        );
                      },
                      child: const Text(
                        'Show all',
                        style: TextStyle(color: Colors.white),
                      ),
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

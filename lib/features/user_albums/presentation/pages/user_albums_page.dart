import 'package:flutter/material.dart';
import 'package:test_for_eclipse/features/album_photos/presentation/pages/album_photos_page.dart';
import 'package:test_for_eclipse/features/user_albums/data/models/albums_model.dart';

class UserAlbums extends StatelessWidget {
  final List<AlbumsModel> userAlbums;
  const UserAlbums({required this.userAlbums, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: ListView.builder(
          itemCount: userAlbums.length,
          itemBuilder: (context, index) {
            return Card(
              child: MaterialButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AlbumsPhotoPage(albumId: userAlbums[index].id),
                      )
                  );
                },
                child: ListTile(
                  title: Text('${userAlbums[index].id}. ${userAlbums[index].title}'),
                ),
              ),
            );
          }
      ),
    );
  }
}

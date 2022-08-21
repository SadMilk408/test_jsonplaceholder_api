import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/album_photos/presentation/bloc/albums_photos_bloc.dart';
import 'package:test_for_eclipse/injection_container.dart';

import '../widgets/album_photos_widget.dart';

class AlbumsPhotoPage extends StatelessWidget {
  final int albumId;

  const AlbumsPhotoPage({required this.albumId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: BlocProvider(
        create: (context) => sl<AlbumsPhotosBloc>()
          ..add(AlbumsPhotosLoadingEvent(albumId: albumId)),
        child: BlocBuilder<AlbumsPhotosBloc, AlbumsPhotosState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (state is ErrorState) {
              return Center(child: Text(state.message),);
            }
            if (state is DoneState) {
              return AlbumPhotosWidget(photosList: state.photosList.photos);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

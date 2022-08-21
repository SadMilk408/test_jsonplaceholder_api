import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/album_photos/domain/entities/photos_entity.dart';
import 'package:test_for_eclipse/features/album_photos/domain/usecases/get_album_photos.dart';

part 'albums_photos_event.dart';
part 'albums_photos_state.dart';

class AlbumsPhotosBloc extends Bloc<AlbumsPhotosEvent, AlbumsPhotosState> {
  GetAlbumPhotos getAlbumPhotos;

  AlbumsPhotosBloc({required this.getAlbumPhotos}) : super(EmptyState()) {
    on<AlbumsPhotosLoadingEvent>((event, emit) async {
        emit(LoadingState());
        final failureOrSuccessAllAlbums = await getAlbumPhotos(event.albumId);
        failureOrSuccessAllAlbums.fold(
          (failure) => emit(
            ErrorState(
              message: _mapFailureToMessage(failure),
            ),
          ),
          (r) => emit(
            DoneState(photosList: r),
          ),
        );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}

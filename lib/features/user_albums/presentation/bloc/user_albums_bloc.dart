import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/user_albums/domain/entities/albums_entity.dart';
import 'package:test_for_eclipse/features/user_albums/domain/usecases/get_user_albums.dart';

part 'user_albums_event.dart';
part 'user_albums_state.dart';

class UserAlbumsBloc extends Bloc<UserAlbumsEvent, UserAlbumsState> {
  GetUserAlbums getUserAlbums;

  UserAlbumsBloc({
    required this.getUserAlbums,
  }) : super(EmptyState()) {
    on<UserAlbumsLoadingEvent>(
      (event, emit) async {
        emit(LoadingState());
        final failureOrSuccessAllAlbums = await getUserAlbums(event.userId);
        failureOrSuccessAllAlbums.fold(
          (failure) => emit(
            ErrorState(
              message: _mapFailureToMessage(failure),
            ),
          ),
          (r) => emit(
            DoneState(albumsList: r),
          ),
        );
      },
    );
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

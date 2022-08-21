import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/user_posts/domain/entities/posts_entity.dart';

import 'package:test_for_eclipse/features/user_posts/domain/usecases/get_user_posts.dart';

part 'user_posts_event.dart';
part 'user_posts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  GetUserPosts getUserPosts;

  UserPostsBloc({
    required this.getUserPosts,
  }) : super(EmptyState()) {
    on<UserPostsLoadingEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrSuccess = await getUserPosts(event.userId);
      failureOrSuccess.fold(
        (failure) => emit(
          ErrorState(
            message: _mapFailureToMessage(failure),
          ),
        ),
        (r) => emit(
          DoneState(postsList: r),
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

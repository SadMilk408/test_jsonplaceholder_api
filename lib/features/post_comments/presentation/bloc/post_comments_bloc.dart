import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';
import 'package:test_for_eclipse/features/post_comments/domain/entities/post_comments_entity.dart';
import 'package:test_for_eclipse/features/post_comments/domain/usecases/get_post_comments.dart';
import 'package:test_for_eclipse/features/post_comments/domain/usecases/post_post_comments.dart';

part 'post_comments_event.dart';
part 'post_comments_state.dart';

class PostCommentsBloc extends Bloc<PostCommentsEvent, PostCommentsState> {
  GetPostComment getPostComment;
  PostPostComment postPostComment;

  PostCommentsBloc(
      {required this.getPostComment, required this.postPostComment})
      : super(EmptyState()) {
    on<PostCommentsLoadingEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrSuccess = await getPostComment(event.postId);
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

    on<SendNewCommentEvent>((event, emit) async {
      DoneState oldDoneState = state as DoneState;
      emit(LoadingState());
      final failureOrSuccess = await postPostComment(event.commentsModel);
      failureOrSuccess.fold(
        (failure) => emit(
          ErrorState(
            message: _mapFailureToMessage(failure),
          ),
        ),
        (r) {
          oldDoneState.postsList.comments.add(r);
          emit(
            DoneState(postsList: oldDoneState.postsList),
          );
        },
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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:test_for_eclipse/features/users/domain/usecases/get_users_list.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  GetUsersList getUsersList;

  UsersBloc({
    required this.getUsersList,
  }) : super(EmptyState()) {
    on<UsersLoadingEvent>(
      (event, emit) async {
        emit(LoadingState());
        final failureOrSuccess = await getUsersList(NoParams());
        failureOrSuccess.fold(
          (failure) => emit(
            ErrorState(
              message: _mapFailureToMessage(failure),
            ),
          ),
          (r) => emit(
            DoneState(usersList: r),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/users/presentation/bloc/users_bloc.dart';
import 'package:test_for_eclipse/features/users/presentation/pages/user_info_page.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
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
          return ListView.builder(
              itemCount: state.usersList.users.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserInfoPage(userInfo: state.usersList.users[index]),
                        )
                    );
                  },
                  child: ListTile(
                    title: Text(state.usersList.users[index].username),
                    subtitle: Text(state.usersList.users[index].name),
                  ),
                );
              }
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

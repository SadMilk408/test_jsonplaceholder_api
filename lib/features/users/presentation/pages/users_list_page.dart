import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_for_eclipse/features/users/presentation/widgets/widgets.dart';
import 'package:test_for_eclipse/injection_container.dart';

import '../bloc/users_bloc.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocProvider(
        create: (context) => sl<UsersBloc>()..add(UsersLoadingEvent()),
        child: const UsersListWidget(),
      ),
    );
  }
}
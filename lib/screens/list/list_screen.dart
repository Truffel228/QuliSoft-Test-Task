import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qulisoft_test_task/screens/list/bloc/list_bloc.dart';

import 'widgets/widgets.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListBloc>().add(ListFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QuliSoft Text Task'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is ListLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            );
          }
          if (state is ListLoadedState) {
            return SizedBox.expand(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) =>
                    UserListItem(user: state.users[index]),
              ),
            );
          }
          return Center(
            child: Text('Error has occurred'),
          );
        },
      ),
    );
  }
}

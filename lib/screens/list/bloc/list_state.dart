part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();
}

class ListLoadingState extends ListState {
  @override
  List<Object> get props => [];
}

class ListLoadedState extends ListState {
  const ListLoadedState({required this.users});
  final List<User> users;
  @override
  List<Object?> get props => [users];
}

class ListErrorState extends ListState {
  @override
  List<Object?> get props => [];
}

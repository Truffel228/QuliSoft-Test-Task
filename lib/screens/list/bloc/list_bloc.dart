import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qulisoft_test_task/models/user/user.dart';
import 'package:qulisoft_test_task/repositories/user/user_repository_interface.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final UserRepositoryInterface _userRepository;
  ListBloc({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository,
        super(ListLoadingState()) {
    on<ListFetchEvent>(_onListFetchEvent);
  }
  void _onListFetchEvent(ListFetchEvent event, emit) async {
    try {
      emit(ListLoadingState());
      final usersList = await _userRepository.getUsers();
      emit(ListLoadedState(users: usersList));
    } catch (e) {
      emit(ListErrorState());
    }
  }
}

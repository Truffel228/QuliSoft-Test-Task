import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qulisoft_test_task/repositories/user/user_repository.dart';
import 'package:qulisoft_test_task/repositories/user/user_repository_interface.dart';
import 'package:qulisoft_test_task/screens/list/bloc/list_bloc.dart';
import 'package:qulisoft_test_task/services/user/user_service.dart';
import 'package:qulisoft_test_task/services/user/user_service_interface.dart';
import 'package:qulisoft_test_task/shared/routes.dart';
import 'package:qulisoft_test_task/shared/style.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Dio _httpClient;

  late final UserServiceInterface _userService;

  late final UserRepositoryInterface _userRepository;

  @override
  void initState() {
    super.initState();
    _httpClient = Dio();
    _userService = UserService(httpClient: _httpClient);
    _userRepository = UserRepository(userService: _userService);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(userRepository: _userRepository),
      child: MaterialApp(
        title: 'QuliSoft Text Task',
        theme: lightTheme,
        initialRoute: Routes.listScreen,
        routes: Routes.routes,
      ),
    );
  }
}

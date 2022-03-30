import 'package:qulisoft_test_task/models/user/user.dart';
import 'package:qulisoft_test_task/repositories/user/user_repository_interface.dart';
import 'package:qulisoft_test_task/services/user/user_service_interface.dart';

class UserRepository implements UserRepositoryInterface {
  UserRepository({required UserServiceInterface userService})
      : _userService = userService;
  final UserServiceInterface _userService;
  @override
  Future<List<User>> getUsers() async {
    try {
      final usersList = await _userService.getUsers();
      return usersList;
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:qulisoft_test_task/models/user/user.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> getUsers();
}

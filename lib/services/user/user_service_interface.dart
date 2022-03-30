import 'package:qulisoft_test_task/models/user/user.dart';

abstract class UserServiceInterface{
  Future<List<User>> getUsers ();
}
import 'package:dio/dio.dart';
import 'package:qulisoft_test_task/models/user/user.dart';
import 'package:qulisoft_test_task/services/user/user_service_interface.dart';
import 'package:qulisoft_test_task/shared/constants.dart';

class UserService implements UserServiceInterface {
  UserService({required Dio httpClient}) : _httpClient = httpClient;
  final Dio _httpClient;
  @override
  Future<List<User>> getUsers() async {
    try {
      final Response response = await _httpClient.get(Constants.usersUrl);
      final dataList = response.data as List<dynamic>;
      final usersList = dataList
          .map(
            (item) => User(
                name: item['user']['name'],
                username: item['user']['username'],
                imageUrl: item['user']['profile_image']['large']),
          )
          .toList();
      return usersList;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}

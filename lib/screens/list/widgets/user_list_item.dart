import 'package:flutter/material.dart';
import 'package:qulisoft_test_task/models/user/user.dart';
import 'package:qulisoft_test_task/screens/photo/photo_screen.dart';
import 'package:qulisoft_test_task/shared/routes.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.photoScreen,
          arguments: PhotoScreenArguments(user.imageUrl)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: 80,
        width: double.infinity,
        child: ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(user.imageUrl)),
          title: Text(user.name),
          subtitle: Text(user.username),
        ),
      ),
    );
  }
}

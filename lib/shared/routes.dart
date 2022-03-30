import 'package:flutter/material.dart';
import 'package:qulisoft_test_task/screens/list/list_screen.dart';
import 'package:qulisoft_test_task/screens/photo/photo_screen.dart';

abstract class Routes{
  static String listScreen = '/listScreen';
  static String photoScreen = '/photoScreen';

  static Map<String, WidgetBuilder> get routes => {
    listScreen : (BuildContext context)=> ListScreen(),
    photoScreen : (BuildContext context)=>PhotoScreen(),
  };
}
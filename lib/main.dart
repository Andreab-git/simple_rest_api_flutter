import 'package:flutter/material.dart';
import 'package:simple_rest_api_flutter/pages/homepage.dart';
import 'package:simple_rest_api_flutter/pages/list_users_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple REST API flutter app',
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/' : (context) => MyHomePage(title:'Flutter Demo Home Page' ),
        '/list_users_page' : (context) => ListUsersPage(),
      },
    );
  }
}



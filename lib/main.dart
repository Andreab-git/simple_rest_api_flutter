import 'package:flutter/material.dart';
import 'package:simple_rest_api_flutter/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (context) => HomePage(),
        // '/LoginAsUser' : (context) => LoginAsUser(),
        // 'LoginAsGuest' :  (context) => LoginAsGuest()
      },
    );
  }
}


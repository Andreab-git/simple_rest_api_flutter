import 'package:flutter/material.dart';
import 'package:simple_rest_api_flutter/pages/getdata.dart';
import 'package:simple_rest_api_flutter/pages/getimg.dart';
import 'package:simple_rest_api_flutter/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (context) => HomePage(),
        '/GetData' : (context) => GetData(),
        '/GetImg' :  (context) => GetImg()
      },
    );
  }
}


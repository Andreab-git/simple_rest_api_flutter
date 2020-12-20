import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_rest_api_flutter/pages/getdata.dart';
import 'package:simple_rest_api_flutter/services/api_manager.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> _str;

  @override
  void initState() {
    super.initState();

    _str = API_Manager().getResponse();
    print(_str.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('GET data'),
              onPressed: () {
                Navigator.of(context).pushNamed('/GetData');
              },
            ),
            RaisedButton(
              child: Text('GET img'),
              onPressed: () {
                Navigator.pushNamed(context, '/GetImg');
              },
            )
          ],
        ),
      ),
    );
  }
}

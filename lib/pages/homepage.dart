import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_rest_api_flutter/models/user_model.dart';
import 'package:simple_rest_api_flutter/services/api_manager.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[

            Text(
              "Write below user's name and job.\n After that, press the plus button",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: nameController,
            ),

            TextField(
              controller: jobController,
            ),

            SizedBox(height: 20),
            _user == null ? Container() :
            Text('The user ${_user.name}, ${_user.id} is created successfully at time '
                '${_user.createdAt.toIso8601String()}'),

            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text('List users'),
                onPressed: () {
                  Navigator.pushNamed(context, '/list_users_page');
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobTitle = jobController.text;

          final UserModel user = await API_Manager().createUser(name, jobTitle);

          setState(() {
            _user = user;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
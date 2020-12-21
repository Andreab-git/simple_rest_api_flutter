import 'package:flutter/material.dart';
import 'package:simple_rest_api_flutter/models/list_users.dart';
import 'package:simple_rest_api_flutter/services/api_manager.dart';


class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {

  Future<ListUsers> _listUsers;

  @override
  void initState() {
    super.initState();

    _listUsers = API_Manager().listUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List users page'),
        backgroundColor: Colors.grey[800],
      ),
      body: FutureBuilder<ListUsers> (
        future: _listUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, i) {
                var newItem = snapshot.data.data[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                              'Email: ${newItem.email}\n'
                              'First_name: ${newItem.firstName}\n'
                              'Last_name: ${newItem.lastName}\n'
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('${newItem.avatar}'),
                        radius: 28,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
            );
          else {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            );
          }
        },
      ),
    );
  }
}

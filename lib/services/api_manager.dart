import 'dart:convert';
import 'package:simple_rest_api_flutter/constants/strings.dart';
import 'package:simple_rest_api_flutter/models/list_users.dart';
import 'package:http/http.dart' as http;
import 'package:simple_rest_api_flutter/models/user_model.dart';


class API_Manager {
  Future<UserModel> createUser(String name, String jobTitle) async {
    final String apiUrl = Strings.postCreate;

    try {
      final response = await http.post(apiUrl, body: {
        "name": name,
        "job": jobTitle
      });

      if (response.statusCode == 201) {
        final String responseStr = response.body;

        return userModelFromJson(responseStr);
      } else {
        return null;
      }
    } catch (Exc) {
      return null;
    }
  }

  Future<ListUsers> listUsers() async {
    final String apiUrl = Strings.getListUsers;

    ListUsers listUsers;

    try {
      final response = await http.get(Uri.parse(Strings.getListUsers));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        listUsers = listUsersFromJson(jsonString);
        return listUsers;
      }

    } catch (Exc) {
      print(Exc);
      return null;
    }

    return null;
  }


}
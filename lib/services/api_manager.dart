import 'package:http/http.dart' as http;
import 'package:simple_rest_api_flutter/constants/strings.dart';


class API_Manager {

  String responseAPI;

  Future<String> getResponse() async {
    try {
      var response = await http.get(Uri.parse(Strings.myAPI));
      if (response.statusCode == 200) {
        responseAPI = response.body;
        return responseAPI;
      }
    } catch (Exc) {
      return responseAPI;
    }
    return responseAPI;
  }
}
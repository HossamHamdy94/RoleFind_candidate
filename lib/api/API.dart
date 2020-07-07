import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rolefind/Models/JobModel.dart';
import 'package:rolefind/Models/user_model.dart';

class API {
  static const String _BASE_URL = "https://api.rolefind.com/api/v0.6.1/";

  static Future<List<Job>> getAllJobs() async {
    final response = await http.get('https://api.rolefind.com/api/v0.6.1/job/list');
    if (response.statusCode == 200) {
      print(response.body);


      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    

      print("hhhhhhhhhhhhhhhhhhhhhhhh"+parsed.toString());
      return parsed.map<Job>((item) => Job.fromJson(item)).toList();
    } else {
      //print('Error');
      throw Exception("Can't load Jobs");
    }
  }

  static Future<UserModel> login(String email, String password) async {
    final String apiUrl =  ("https://api.rolefind.com/api/v0.6.1/user-auth/login");
    dynamic response = await http.post(apiUrl, body: {
      "email": email,
      "password": password,
    });
    final String res = response.body;
    final JsonDecoder _decoder = new JsonDecoder();
    dynamic decoded = _decoder.convert(res);
    if (response.statusCode == 201) {
      print(response);

      print(decoded["user"]["email"]);
      return userModelFromJson(res);
    } else {
      print(response.body);
      throw new Exception(decoded["errorCode"]);

    }
  }

  static Future<UserModel> createUser(
      String name, String email, String industry, String password) async {
    final String apiUrl =
    ('https://api.rolefind.com/api/v0.6.1/user-auth/create');
    final response = await http.post(apiUrl, body: {
      "name": name,
      "email": email,
      "title": industry,
      "password": password,
    });
    print(response.body);
    if (response.statusCode == 201) {
      print(response.body);
      final String responseString = response.body;

      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }
}

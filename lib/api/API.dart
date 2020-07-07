import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rolefind/Models/JobModel.dart';

class API {

  static const String _BASE_URL = 'https://api.rolefind.com/api/v0.6.1/';
  static Future<List<Job>> getAllPosts() async
  {
    final  response = await http.get('$_BASE_URL/job/list-client');
    if (response.statusCode == 200) {
      print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Job>((item) => Job.fromJson(item)).toList();
    } else {
      //print('Error');
      throw Exception("Can't load author");
    }
  }

  }


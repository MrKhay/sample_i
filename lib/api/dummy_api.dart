import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class DummyApi {
  static Future<UserDetail> getDummy() async {
    var uri = Uri.https("dummyjson.com", "/auth/login");


    print("Fecting api");

    final response = await http.post(uri,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode({
          "username": 'kminchelle',
          "password": '0lelplR',
        }));

    print("Status code: ${response.statusCode}");



    Map data = jsonDecode(response.body);

    return UserDetail.fromJson(data);
  }
}

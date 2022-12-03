import 'dart:convert';
import 'package:http/http.dart' as http;

class DataApi {
  static Future<List<dynamic>> getData() async {
    var uri = Uri.https("dummyjson.com", "/products/categories");

    print("Loading");
    final response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    print("Status code: ${response.statusCode}");

    List<dynamic> data = jsonDecode(response.body);

    List<dynamic> temp = [];

    for (var i in data) {
      temp.add(i);
    }

    return temp;
  }
}

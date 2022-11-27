import 'dart:convert';
import 'package:http/http.dart' as http;

class Request {
  static Future<List> requestCountry() async {
    Map list = {};
    List countries = [];
    String apiUrl = 'https://api.nobelprize.org/v1/country.json';

    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      list = json.decode(response.body);
      for (var country in list.values.first) {
        countries.add({
          "name": country["name"],
          "code": country["code"],
          "isVisible": false
        });
      }
      return countries;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}

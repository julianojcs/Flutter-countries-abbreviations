import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Request {
  static Future<List> requestCountry() async {
    Map countries = {};
    String apiUrl = 'https://api.nobelprize.org/v1/country.json';

    http.Response response = await http.get(Uri.parse(apiUrl));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      countries = json.decode(response.body);
      return countries.values.first;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}

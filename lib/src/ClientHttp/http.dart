import 'dart:convert';
import 'package:http/http.dart'as http;
import '../models/JsonModel.dart';

Future<JsonModel> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var jsonModel = JsonModel.fromJson(json);
  return jsonModel;
}

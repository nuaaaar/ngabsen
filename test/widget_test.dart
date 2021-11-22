import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ngabsen/app/data/models/user_model.dart';

void main() async{
  Uri url = Uri.parse("http://127.0.0.1:8000/api/auth/login");
  final response = await http.post(url, body: {
    "username": "testing",
    "password": "password"
  });

  final data = jsonDecode(response.body);
  final user = User.fromJson(data['user']);

  print(user);
}
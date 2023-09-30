import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:tecnical_test_todo_app/config/env/env.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';

class AuthServices extends ChangeNotifier {
  bool isLoading = false;
  UserResponse? user;
  final _headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    const url = "${Env.baseUrl}/auth";

    final Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    isLoading = true;
    notifyListeners();
    final resp = await http.post(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(body),
    );
    user = userResponseFromJson(resp.body);
    isLoading = false;
    notifyListeners();
  }

  Future<void> createUser({
    required String nombre,
    required String email,
    required String password,
  }) async {
    const url = "${Env.baseUrl}/user";
    final Map<String, dynamic> body = {
      "nombre": nombre,
      "email": email,
      "password": password,
    };

    isLoading = true;
    notifyListeners();
    final resp = await http.post(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(body),
    );
    user = userResponseFromJson(resp.body);
    isLoading = false;
    notifyListeners();
  }
}

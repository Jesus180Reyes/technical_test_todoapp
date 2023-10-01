import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tecnical_test_todo_app/config/env/env.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';

class AuthServices extends ChangeNotifier {
  String errorMsg = "";
  bool isLoading = false;
  UserResponse? user;
  final _headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final storage = const FlutterSecureStorage();

  Future<bool> loginUser({
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
    if (resp.statusCode != 200) {
      final msg = jsonDecode(resp.body);
      errorMsg = msg["msg"];
      notifyListeners();
      return false;
    }

    user = userResponseFromJson(resp.body);
    await storage.write(key: "x-token", value: user!.token);
    await storage.write(key: "userId", value: user!.user.id.toString());
    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> createUser({
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
    if (resp.statusCode != 200) {
      final msg = jsonDecode(resp.body);
      errorMsg = msg["msg"];
      notifyListeners();
      return false;
    }
    user = userResponseFromJson(resp.body);
    await storage.write(key: "x-token", value: user!.token);
    await storage.write(key: "userId", value: user!.user.id.toString());
    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> getUserById({
    required String userId,
  }) async {
    final url = "${Env.baseUrl}/user/$userId";

    isLoading = true;
    notifyListeners();
    final resp = await http.get(
      Uri.parse(url),
      headers: _headers,
    );
    if (resp.statusCode != 200) {
      final msg = jsonDecode(resp.body);
      errorMsg = msg["msg"];
      notifyListeners();
      return false;
    }
    user = userResponseFromJson(resp.body);
    isLoading = false;
    notifyListeners();
    return true;
  }

  Future logOut() async {
    await storage.deleteAll();
  }
}

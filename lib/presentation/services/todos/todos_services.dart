import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tecnical_test_todo_app/config/env/env.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';

class TodoServices extends ChangeNotifier {
  List<Todo> todos = [];
  bool isLoading = false;
  final _storage = const FlutterSecureStorage();

  Future<void> getTodosByUserId({
    required String userID,
    required String status,
  }) async {
    final token = await _storage.read(key: "x-token");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "x-token": token!,
    };
    final url = "${Env.baseUrl}/todo/user/$userID/$status";

    isLoading = true;
    notifyListeners();
    final resp = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    final data = todosResponseFromJson(resp.body);
    todos = data.todos;
    isLoading = false;
    notifyListeners();
  }

  Future<void> createTodo({
    required String title,
    String? description,
    required int userId,
  }) async {
    final token = await _storage.read(key: "x-token");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "x-token": token!,
    };
    const url = "${Env.baseUrl}/todo";
    final Map<String, dynamic> body = description != null
        ? {
            "title": title,
            "description": description,
            "user_id": userId,
          }
        : {
            "title": title,
            "user_id": userId,
          };

    isLoading = true;
    notifyListeners();
    await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteTodoById({required String todoId}) async {
    final token = await _storage.read(key: "x-token");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "x-token": token!,
    };
    final url = "${Env.baseUrl}/todo/$todoId";

    isLoading = true;
    notifyListeners();
    await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTodoStatus(
      {required int todoId, required String status}) async {
    final token = await _storage.read(key: "x-token");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "x-token": token!,
    };
    const url = "${Env.baseUrl}/todo";
    final Map<String, dynamic> body = {
      "id": todoId,
      "status": status,
    };

    isLoading = true;
    notifyListeners();
    await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTodoContainById({
    required String todoId,
    required String title,
    required String? description,
  }) async {
    final token = await _storage.read(key: "x-token");
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "x-token": token!,
    };
    final url = "${Env.baseUrl}/todo/$todoId";
    final Map<String, dynamic> body = {
      "title": title,
      "description": description,
    };

    isLoading = true;
    notifyListeners();
    final resp = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    print(resp.body);
    isLoading = false;
    notifyListeners();
  }
}

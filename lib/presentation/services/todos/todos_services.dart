import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:tecnical_test_todo_app/config/env/env.dart';
import 'package:tecnical_test_todo_app/entities/entities.dart';

class TodoServices extends ChangeNotifier {
  List<Todo> todos = [];
  bool isLoading = false;
  final _headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    "x-token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjUsImlhdCI6MTY5NjEwNTc3MSwiZXhwIjoxNjk2MTQ4OTcxfQ.59Ub4SVYmix-gH5Os4WFzTuDpAQWjNfwrP1Gbc6FxOM",
  };

  Future<void> getTodosByUserId({
    required String userID,
    required String status,
  }) async {
    final url = "${Env.baseUrl}/todo/user/$userID/$status";

    isLoading = true;
    notifyListeners();
    final resp = await http.get(
      Uri.parse(url),
      headers: _headers,
    );
    final data = todosResponseFromJson(resp.body);
    todos = data.todos;
    isLoading = false;
    notifyListeners();
  }
}

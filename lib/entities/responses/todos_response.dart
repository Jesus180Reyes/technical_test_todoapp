// To parse this JSON data, do
//
//     final todosResponse = todosResponseFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

TodosResponse todosResponseFromJson(String str) =>
    TodosResponse.fromJson(json.decode(str));

String todosResponseToJson(TodosResponse data) => json.encode(data.toJson());

class TodosResponse {
  final bool ok;
  final List<Todo> todos;

  TodosResponse({
    required this.ok,
    required this.todos,
  });

  factory TodosResponse.fromJson(Map<String, dynamic> json) => TodosResponse(
        ok: json["ok"],
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
      };
}

class Todo {
  final int id;
  final String title;
  final String description;
  final String status;
  final bool state;
  final int userId;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.state,
    required this.userId,
    required this.createdAt,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        state: json["state"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "state": state,
        "user_id": userId,
        "createdAt": createdAt.toIso8601String(),
      };
}

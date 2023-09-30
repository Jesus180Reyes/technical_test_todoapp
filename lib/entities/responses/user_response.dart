// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final bool ok;
  final User user;
  final String token;

  UserResponse({
    required this.ok,
    required this.user,
    required this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        ok: json["ok"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  final int id;
  final String nombre;
  final String email;
  final String password;
  final bool state;
  final int todosCompleted;
  final DateTime createdAt;

  User({
    required this.id,
    required this.nombre,
    required this.email,
    required this.password,
    required this.state,
    required this.todosCompleted,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        state: json["state"],
        todosCompleted: json["todosCompleted"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
        "password": password,
        "state": state,
        "todosCompleted": todosCompleted,
        "createdAt": createdAt.toIso8601String(),
      };
}

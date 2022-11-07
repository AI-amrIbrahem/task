import 'dart:convert';

UserLoginResponse uerLoginResponseFromJson(String str) => UserLoginResponse.fromJson(json.decode(str));

String uerLoginResponseToJson(UserLoginResponse data) => json.encode(data.toJson());

class UserLoginResponse {
  UserLoginResponse({
    required this.user,
    required this.token,
  });

  UserModel user;
  String token;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => UserLoginResponse(
    user: UserModel.fromJson(json["user"]),
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"]??0,
    name: json["name"]??'',
    email: json["email"]??'',
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]??''),
    createdAt: DateTime.parse(json["created_at"]??''),
    updatedAt: DateTime.parse(json["updated_at"]??''),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

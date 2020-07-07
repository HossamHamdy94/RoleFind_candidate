import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name ;
  String email;
  String industry;
  String password;


  UserModel({
    this.name,
    this.email,
    this.industry,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name :json["name"],
    email: json["email"],
    industry: json["industry"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name":name,
    "email": email,
    "industry": industry,
    "password": password,
  };
}
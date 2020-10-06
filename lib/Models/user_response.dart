// To parse this JSON data, do
//
//     final userRespone = userResponeFromJson(jsonString);

import 'dart:convert';

UserRespone userResponeFromJson(String str) => UserRespone.fromJson(json.decode(str));

String userResponeToJson(UserRespone data) => json.encode(data.toJson());

class UserRespone {
  UserRespone({
    this.tokens,
    this.user,
  });

  Tokens tokens;
  User user;

  factory UserRespone.fromJson(Map<String, dynamic> json) => UserRespone(
    tokens: Tokens.fromJson(json["tokens"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "tokens": tokens.toJson(),
    "user": user.toJson(),
  };
}

class Tokens {
  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class User {
  User({
    this.overview,
    this.availability,
    this.savedBy,
    this.acceptedJobs,
    this.id,
    this.name,
    this.title,
    this.email,
    this.privacy,
    this.v,
    this.avatar,
  });

  Overview overview;
  String availability;
  List<dynamic> savedBy;
  List<dynamic> acceptedJobs;
  String id;
  String name;
  String title;
  String email;
  List<dynamic> privacy;
  int v;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    overview: Overview.fromJson(json["overview"]),
    availability: json["availability"],
    savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
    acceptedJobs: List<dynamic>.from(json["acceptedJobs"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    title: json["title"],
    email: json["email"],
    privacy: List<dynamic>.from(json["privacy"].map((x) => x)),
    v: json["__v"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "overview": overview.toJson(),
    "availability": availability,
    "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
    "acceptedJobs": List<dynamic>.from(acceptedJobs.map((x) => x)),
    "_id": id,
    "name": name,
    "title": title,
    "email": email,
    "privacy": List<dynamic>.from(privacy.map((x) => x)),
    "__v": v,
    "avatar": avatar,
  };
}

class Overview {
  Overview({
    this.blocks,
  });

  List<dynamic> blocks;

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
    blocks: List<dynamic>.from(json["blocks"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "blocks": List<dynamic>.from(blocks.map((x) => x)),
  };
}
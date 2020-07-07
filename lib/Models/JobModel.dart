import 'dart:convert';

List<Job> jobFromJson(String str) => List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job({
    this.title,
    this.location,
    this.description,
    this.budget,
    this.duration,
    this.professionalCount,
    this.paymentSchedule,
    this.industry,
    this.type,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String title;
  String location;
  String description;
  int budget;
  int duration;
  int professionalCount;
  String paymentSchedule;
  String industry;
  String type;
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    title: json["title"],
  //  location: json["location"],
  //  description: (json["description"]),
    budget: json["budget"],
    duration: json["duration"],
    professionalCount: json["professionalCount"],
    paymentSchedule: json["paymentSchedule"],
    industry: json["industry"],
    type: json["type"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "location": location,
    "description": description,
    "budget": budget,
    "duration": duration,
    "professionalCount": professionalCount,
    "paymentSchedule": paymentSchedule,
    "industry": industry,
    "type": type,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Description {
  Description({
    this.blocks,
    this.entityMap,
  });

  List<dynamic> blocks;
  EntityMap entityMap;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    blocks: List<dynamic>.from(json["blocks"].map((x) => x)),
    entityMap: EntityMap.fromJson(json["entityMap"]),
  );

  Map<String, dynamic> toJson() => {
    "blocks": List<dynamic>.from(blocks.map((x) => x)),
    "entityMap": entityMap.toJson(),
  };
}

class EntityMap {
  EntityMap();

  factory EntityMap.fromJson(Map<String, dynamic> json) => EntityMap(
  );

  Map<String, dynamic> toJson() => {
  };
}
import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job({
    this.location,
    this.description,
    this.life,
    this.status,
    this.applications,
    this.id,
    this.title,
    this.budget,
    this.professionalCount,
    this.type,
    this.industry,
    this.paymentSchedule,
    this.duration,
    this.client,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.applicationCounts,
    this.acceptedApplicationsCount,
  });

  dynamic location;
  Description description;
  String life;
  String status;
  List<String> applications;
  String id;
  String title;
  int budget;
  int professionalCount;
  String type;
  String industry;
  String paymentSchedule;
  int duration;
  Client client;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int applicationCounts;
  int acceptedApplicationsCount;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    location: json["location"],
    description: Description.fromJson(json["description"]),
    life: json["life"],
    status: json["status"],
    applications: List<String>.from(json["applications"].map((x) => x)),
    id: json["_id"],
    title: json["title"],
    budget: json["budget"],
    professionalCount: json["professionalCount"],
    type: json["type"],
    industry: json["industry"],
    paymentSchedule: json["paymentSchedule"],
    duration: json["duration"],
    client: Client.fromJson(json["client"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    applicationCounts: json["applicationCounts"],
    acceptedApplicationsCount: json["acceptedApplicationsCount"],
  );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "description": description.toJson(),
        "life": life,
        "status": status,
        "applications": List<dynamic>.from(applications.map((x) => x)),
        "_id": id,
        "title": title,
        "budget": budget,
        "professionalCount": professionalCount,
        "type": type,
        "industry": industry,
        "paymentSchedule": paymentSchedule,
        "duration": duration,
        "client": client.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "applicationCounts": applicationCounts,
        "acceptedApplicationsCount": acceptedApplicationsCount,
      };
}

class Client {
  Client({
    this.id,
    this.name,
    this.avatar,
  });

  String id;
  String name;
  String avatar;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["_id"],
        name: json["name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "avatar": avatar,
      };
}

class Location {
  Location({
    this.city,
    this.country,
  });

  String city;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        country: json["country"],
      );

  Map<String, String> toJson() => {
        "city": city,
        "country": country,
      };
}

class Description {
  Description({
    this.blocks,
  });

  List<Block> blocks;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
      };
}

class Block {
  Block({
    this.key,
    this.text,
    this.type,
    this.depth,
    this.inlineStyleRanges,
    this.entityRanges,
  });

  String key;
  String text;
  Type type;
  int depth;
  List<InlineStyleRange> inlineStyleRanges;
  List<dynamic> entityRanges;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        key: json["key"],
        text: json["text"],
        type: typeValues.map[json["type"]],
        depth: json["depth"],
        inlineStyleRanges: List<InlineStyleRange>.from(
            json["inlineStyleRanges"].map((x) => InlineStyleRange.fromJson(x))),
        entityRanges: List<dynamic>.from(json["entityRanges"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "text": text,
        "type": typeValues.reverse[type],
        "depth": depth,
        "inlineStyleRanges":
            List<dynamic>.from(inlineStyleRanges.map((x) => x.toJson())),
        "entityRanges": List<dynamic>.from(entityRanges.map((x) => x)),
      };
}

class InlineStyleRange {
  InlineStyleRange({
    this.offset,
    this.length,
    this.style,
  });

  int offset;
  int length;
  Style style;

  factory InlineStyleRange.fromJson(Map<String, dynamic> json) =>
      InlineStyleRange(
        offset: json["offset"],
        length: json["length"],
        style: styleValues.map[json["style"]],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "length": length,
        "style": styleValues.reverse[style],
      };
}

enum Style { BOLD }

final styleValues = EnumValues({"BOLD": Style.BOLD});

enum Type {
  UNSTYLED,
  HEADER_ONE,
  HEADER_THREE,
  UNORDERED_LIST_ITEM,
  HEADER_FIVE,
  HEADER_SIX,
  PARAGRAPH
}

final typeValues = EnumValues({
  "header-five": Type.HEADER_FIVE,
  "header-one": Type.HEADER_ONE,
  "header-six": Type.HEADER_SIX,
  "header-three": Type.HEADER_THREE,
  "paragraph": Type.PARAGRAPH,
  "unordered-list-item": Type.UNORDERED_LIST_ITEM,
  "unstyled": Type.UNSTYLED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

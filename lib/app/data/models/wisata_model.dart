// To parse this JSON data, do
//
//     final wisataModels = wisataModelsFromJson(jsonString);

import 'dart:convert';

WisataModels wisataModelsFromJson(String str) =>
    WisataModels.fromJson(json.decode(str));

String wisataModelsToJson(WisataModels data) => json.encode(data.toJson());

class WisataModels {
  WisataModels({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  List<Datum> data;

  factory WisataModels.fromJson(Map<String, dynamic> json) => WisataModels(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.caption,
    required this.category,
    required this.location,
    required this.coordinate,
    required this.description,
    required this.rating,
    required this.monthly_visitor,
    required this.jamOperasi,
    required this.thumbnail,
    required this.image,
  });

  String id;
  String caption;
  List category;
  String location;
  List coordinate;
  String description;
  String rating;
  String monthly_visitor;
  String jamOperasi;
  String thumbnail;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        caption: json["caption"],
        category: json["category"],
        location: json["location"],
        coordinate: json["coordinate"],
        description: json["description"],
        rating: json["rating"],
        monthly_visitor: json["month_visitor"],
        jamOperasi: json["jam_operasi"],
        thumbnail: json["thumbnail"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "category": category,
        "location": location,
        "coordinate": coordinate,
        "description": description,
        "rating": rating,
        "monthly_visitor": monthly_visitor,
        "jam_operasi": jamOperasi,
        "thumbnail": thumbnail,
        "image": image,
      };
}

// To parse this JSON data, do
//
//     final turfDeails = turfDeailsFromJson(jsonString);

import 'dart:convert';

TurfDetails turfDeailsFromJson(String str) => TurfDetails.fromJson(json.decode(str));

String turfDeailsToJson(TurfDetails data) => json.encode(data.toJson());

class TurfDetails {
  TurfDetails({
    required this.message,
    required this.turf,
  });

  final String message;
  final List<Turf> turf;

  factory TurfDetails.fromJson(Map<String, dynamic> json) => TurfDetails(
        message: json["message"],
        turf: List<Turf>.from(json["turf"].map((x) => Turf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "turf": List<dynamic>.from(turf.map((x) => x.toJson())),
      };
}

class Turf {
  Turf({
    required this.id,
    required this.centername,
    required this.phone,
    required this.location,
    required this.category,
    required this.price,
    required this.turfPictures,
    required this.v,
  });

  final String id;
  final String centername;
  final int phone;
  final String location;
  final String category;
  final int price;
  final List<String> turfPictures;
  final int v;

  factory Turf.fromJson(Map<String, dynamic> json) => Turf(
        id: json["_id"],
        centername: json["centername"],
        phone: json["phone"],
        location: json["location"],
        category: json["category"],
        price: json["price"],
        turfPictures: List<String>.from(json["turfPictures"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "centername": centername,
        "phone": phone,
        "location": location,
        "category": category,
        "price": price,
        "turfPictures": List<dynamic>.from(turfPictures.map((x) => x)),
        "__v": v,
      };
}

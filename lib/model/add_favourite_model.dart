// To parse this JSON data, do
//
//     final addFavouriteData = addFavouriteDataFromJson(jsonString);

import 'dart:convert';

AddFavouriteData addFavouriteDataFromJson(String str) =>
    AddFavouriteData.fromJson(json.decode(str));

String addFavouriteDataToJson(AddFavouriteData data) => json.encode(data.toJson());

class AddFavouriteData {
  AddFavouriteData({
    required this.message,
    required this.turf,
  });

  final String message;
  final List<Turf> turf;

  factory AddFavouriteData.fromJson(Map<String, dynamic> json) => AddFavouriteData(
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
    required this.userId,
    required this.turfId,
    required this.v,
    required this.turfDetails,
  });

  final String id;
  final String userId;
  final String turfId;
  final int v;
  final List<TurfDetail> turfDetails;

  factory Turf.fromJson(Map<String, dynamic> json) => Turf(
        id: json["_id"],
        userId: json["userId"],
        turfId: json["turfId"],
        v: json["__v"],
        turfDetails: List<TurfDetail>.from(json["turfDetails"].map((x) => TurfDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "turfId": turfId,
        "__v": v,
        "turfDetails": List<dynamic>.from(turfDetails.map((x) => x.toJson())),
      };
}

class TurfDetail {
  TurfDetail({
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

  factory TurfDetail.fromJson(Map<String, dynamic> json) => TurfDetail(
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

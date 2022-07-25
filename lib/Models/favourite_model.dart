// To parse this JSON data, do
//
//     final favouriteData = favouriteDataFromJson(jsonString);

import 'dart:convert';

FavouriteData favouriteDataFromJson(String str) => FavouriteData.fromJson(json.decode(str));

String favouriteDataToJson(FavouriteData data) => json.encode(data.toJson());

class FavouriteData {
  FavouriteData({
    this.message,
    this.turf,
  });

  final String? message;
  final List<FavTurf>? turf;

  factory FavouriteData.fromJson(Map<String, dynamic> json) => FavouriteData(
        message: json["message"],
        turf: List<FavTurf>.from(json["turf"].map((x) => FavTurf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "turf": List<dynamic>.from(turf!.map((x) => x.toJson())),
      };
}

class FavTurf {
  FavTurf({
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
  final List<FavTurfDetails> turfDetails;

  factory FavTurf.fromJson(Map<String, dynamic> json) => FavTurf(
        id: json["_id"],
        userId: json["userId"],
        turfId: json["turfId"],
        v: json["__v"],
        turfDetails:
            List<FavTurfDetails>.from(json["turfDetails"].map((x) => FavTurfDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "turfId": turfId,
        "__v": v,
        "turfDetails": List<dynamic>.from(turfDetails.map((x) => x.toJson())),
      };
}

class FavTurfDetails {
  FavTurfDetails({
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

  factory FavTurfDetails.fromJson(Map<String, dynamic> json) => FavTurfDetails(
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

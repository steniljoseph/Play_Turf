// To parse this JSON data, do
//
//     final offerDatas = offerDatasFromJson(jsonString);

import 'dart:convert';

OfferDatas offerDatasFromJson(String str) => OfferDatas.fromJson(json.decode(str));

String offerDatasToJson(OfferDatas data) => json.encode(data.toJson());

class OfferDatas {
  OfferDatas({
    required this.message,
    required this.offer,
  });

  final String message;
  final List<Offer> offer;

  factory OfferDatas.fromJson(Map<String, dynamic> json) => OfferDatas(
        message: json["message"],
        offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
      };
}

class Offer {
  Offer({
    required this.id,
    required this.turfId,
    required this.offerPercent,
    required this.fromDate,
    required this.toDate,
    required this.status,
    required this.v,
    required this.turfDetails,
  });

  final String id;
  final String turfId;
  final int offerPercent;
  final String fromDate;
  final String toDate;
  final bool status;
  final int v;
  final List<TurfDetailOffer> turfDetails;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["_id"],
        turfId: json["turfId"],
        offerPercent: json["offerPercent"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        status: json["status"],
        v: json["__v"],
        turfDetails: List<TurfDetailOffer>.from(json["turfDetails"].map((x) => TurfDetailOffer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "turfId": turfId,
        "offerPercent": offerPercent,
        "fromDate": fromDate,
        "toDate": toDate,
        "status": status,
        "__v": v,
        "turfDetails": List<dynamic>.from(turfDetails.map((x) => x.toJson())),
      };
}

class TurfDetailOffer {
  TurfDetailOffer({
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

  factory TurfDetailOffer.fromJson(Map<String, dynamic> json) => TurfDetailOffer(
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

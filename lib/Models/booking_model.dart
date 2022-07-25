// To parse this JSON data, do
//
//     final bookingDatas = bookingDatasFromJson(jsonString);

import 'dart:convert';

BookingDatas bookingDatasFromJson(String str) => BookingDatas.fromJson(json.decode(str));

String bookingDatasToJson(BookingDatas data) => json.encode(data.toJson());

class BookingDatas {
  BookingDatas({
     this.message,
     this.turf,
  });

  final String? message;
  final List<Turf>? turf;

  factory BookingDatas.fromJson(Map<String, dynamic> json) => BookingDatas(
        message: json["message"],
        turf: List<Turf>.from(json["turf"].map((x) => Turf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "turf": List<dynamic>.from(turf!.map((x) => x.toJson())),
      };
}

class Turf {
  Turf({
    required this.id,
    required this.centerId,
    required this.createdBy,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.totalPrice,
    required this.paymentMode,
    this.offer,
    required this.v,
    required this.turfDetails,
  });

  final String id;
  final String centerId;
  final String createdBy;
  final String date;
  final String startTime;
  final String endTime;
  final String status;
  final int totalPrice;
  final String paymentMode;
  final int? offer;
  final int v;
  final List<TurfDetail> turfDetails;

  factory Turf.fromJson(Map<String, dynamic> json) => Turf(
        id: json["_id"],
        centerId: json["centerId"],
        createdBy: json["createdBy"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
        totalPrice: json["totalPrice"],
        paymentMode: json["paymentMode"],
        offer: json["offer"],
        v: json["__v"],
        turfDetails: List<TurfDetail>.from(json["turfDetails"].map((x) => TurfDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "centerId": centerId,
        "createdBy": createdBy,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
        "totalPrice": totalPrice,
        "paymentMode": paymentMode,
        "offer": offer,
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

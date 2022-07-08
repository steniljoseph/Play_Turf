// To parse this JSON data, do
//
//     final bannerDatas = bannerDatasFromJson(jsonString);

import 'dart:convert';

BannerDatas bannerDatasFromJson(String str) => BannerDatas.fromJson(json.decode(str));

String bannerDatasToJson(BannerDatas data) => json.encode(data.toJson());

class BannerDatas {
  BannerDatas({
    required this.message,
    required this.banner,
  });

  final String message;
  final List<Banner> banner;

  factory BannerDatas.fromJson(Map<String, dynamic> json) => BannerDatas(
        message: json["message"],
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    required this.id,
    required this.bannerImage,
    required this.description,
    required this.v,
  });

  final String id;
  final String bannerImage;
  final String description;
  final int v;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"],
        bannerImage: json["bannerImage"],
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bannerImage": bannerImage,
        "description": description,
        "__v": v,
      };
}

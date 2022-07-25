import 'dart:convert';

UserLoginResponseData userLoginResponseDataFromJson(String str) =>
    UserLoginResponseData.fromJson(json.decode(str));

String userLoginResponseDataToJson(UserLoginResponseData data) => json.encode(data.toJson());

class UserLoginResponseData {
  UserLoginResponseData({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  User? user;
  String? token;

  factory UserLoginResponseData.fromJson(Map<String, dynamic> json) => UserLoginResponseData(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user!.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.password,
    this.isActive,
    this.v,
  });

  String? id;
  String name;
  int? phone;
  String? email;
  String? password;
  bool? isActive;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "isActive": isActive,
        "__v": v,
      };
}

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    required this.name,
    required this.cnic,
    required this.meetto,
    required this.meettime,
  });

  String name;
  String cnic;
  String meetto;
  String meettime;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        cnic: json["cnic"],
        meetto: json["meetto"],
        meettime: json["meettime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cnic": cnic,
        "meetto": meetto,
        "meettime": meettime,
      };
}

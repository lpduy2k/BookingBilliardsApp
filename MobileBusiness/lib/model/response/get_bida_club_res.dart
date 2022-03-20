// To parse this JSON data, do
//
//     final getBidaClubRes = getBidaClubResFromJson(jsonString);

import 'dart:convert';

String getBidaClubResToJson(GetBidaClubRes data) => json.encode(data.toJson());

class GetBidaClubRes {
  GetBidaClubRes({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.image,
    this.timeOpen,
    this.timeClose,
    this.quantity,
    this.status,
    this.userId,
  });

  String? id;
  String? name;
  String? address;
  String? phoneNumber;
  String? image;
  String? timeOpen;
  String? timeClose;
  int? quantity;
  String? status;
  String? userId;

  factory GetBidaClubRes.fromJson(Map<String, dynamic> json) => GetBidaClubRes(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        image: json["image"],
        timeOpen: json["timeOpen"],
        timeClose: json["timeClose"],
        quantity: json["quantity"],
        status: json["status"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "image": image,
        "timeOpen": timeOpen,
        "timeClose": timeClose,
        "quantity": quantity,
        "status": status,
        "userId": userId,
      };
  static GetBidaClubRes getBidaClubResFromJson(String str) =>
      GetBidaClubRes.fromJson(json.decode(str));
}

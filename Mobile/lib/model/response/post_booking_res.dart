// To parse this JSON data, do
//
//     final postBookingRes = postBookingResFromJson(jsonString);

import 'dart:convert';

class PostBookingRes {
  PostBookingRes({
    this.id,
    this.timeBooking,
    this.totalQuantity,
    this.totalPrice,
    this.status,
    this.userId,
    this.user,
  });

  String? id;
  String? timeBooking;
  int? totalQuantity;
  int? totalPrice;
  String? status;
  String? userId;
  dynamic user;

  factory PostBookingRes.fromJson(Map<String, dynamic> json) => PostBookingRes(
        id: json["id"],
        timeBooking: json["timeBooking"],
        totalQuantity: json["totalQuantity"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        userId: json["userId"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timeBooking": timeBooking,
        "totalQuantity": totalQuantity,
        "totalPrice": totalPrice,
        "status": status,
        "userId": userId,
        "user": user,
      };

  static PostBookingRes postBookingResFromJson(String str) =>
      PostBookingRes.fromJson(json.decode(str));

  String postBookingResToJson(PostBookingRes data) =>
      json.encode(data.toJson());
}

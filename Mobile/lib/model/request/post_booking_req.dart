// To parse this JSON data, do
//
//     final postBookingReq = postBookingReqFromJson(jsonString);

import 'dart:convert';

PostBookingReq postBookingReqFromJson(String str) =>
    PostBookingReq.fromJson(json.decode(str));

String postBookingReqToJson(PostBookingReq data) => json.encode(data.toJson());

class PostBookingReq {
  PostBookingReq({
    required this.timeBooking,
    required this.totalQuantity,
    required this.totalPrice,
    required this.status,
    required this.userId,
  });

  DateTime timeBooking;
  int totalQuantity;
  int totalPrice;
  String status;
  String userId;

  factory PostBookingReq.fromJson(Map<String, dynamic> json) => PostBookingReq(
        timeBooking: DateTime.parse(json["timeBooking"]),
        totalQuantity: json["totalQuantity"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "timeBooking": timeBooking.toIso8601String(),
        "totalQuantity": totalQuantity,
        "totalPrice": totalPrice,
        "status": status,
        "userId": userId,
      };
}

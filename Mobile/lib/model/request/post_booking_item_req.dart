// To parse this JSON data, do
//
//     final postBookingItemReq = postBookingItemReqFromJson(jsonString);

import 'dart:convert';

PostBookingItemReq postBookingItemReqFromJson(String str) =>
    PostBookingItemReq.fromJson(json.decode(str));

String postBookingItemReqToJson(PostBookingItemReq data) =>
    json.encode(data.toJson());

class PostBookingItemReq {
  PostBookingItemReq({
    required this.price,
    required this.bookingId,
    required this.bidaTableId,
  });

  int price;
  String bookingId;
  String bidaTableId;

  factory PostBookingItemReq.fromJson(Map<String, dynamic> json) =>
      PostBookingItemReq(
        price: json["price"],
        bookingId: json["bookingId"],
        bidaTableId: json["bidaTableId"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "bookingId": bookingId,
        "bidaTableId": bidaTableId,
      };
}

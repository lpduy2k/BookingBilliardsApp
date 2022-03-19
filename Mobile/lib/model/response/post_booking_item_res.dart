// To parse this JSON data, do
//
//     final postBookingItemRes = postBookingItemResFromJson(jsonString);

import 'dart:convert';

class PostBookingItemRes {
  PostBookingItemRes({
    this.id,
    this.price,
    this.bookingId,
    this.booking,
    this.bidaTableId,
    this.bidaTable,
  });

  String? id;
  int? price;
  String? bookingId;
  dynamic booking;
  String? bidaTableId;
  BidaTable? bidaTable;

  factory PostBookingItemRes.fromJson(Map<String, dynamic> json) =>
      PostBookingItemRes(
        id: json["id"],
        price: json["price"],
        bookingId: json["bookingId"],
        booking: json["booking"],
        bidaTableId: json["bidaTableId"],
        bidaTable: BidaTable.fromJson(json["bidaTable"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "bookingId": bookingId,
        "booking": booking,
        "bidaTableId": bidaTableId,
        "bidaTable": bidaTable?.toJson(),
      };

  static PostBookingItemRes postBookingItemResFromJson(String str) =>
      PostBookingItemRes.fromJson(json.decode(str));

  String postBookingItemResToJson(PostBookingItemRes data) =>
      json.encode(data.toJson());
}

class BidaTable {
  BidaTable({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.price,
    required this.status,
    required this.bidaClubId,
    required this.bidaClub,
  });

  String id;
  String name;
  String type;
  String image;
  int price;
  String status;
  String bidaClubId;
  dynamic bidaClub;

  factory BidaTable.fromJson(Map<String, dynamic> json) => BidaTable(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        status: json["status"],
        bidaClubId: json["bidaClubId"],
        bidaClub: json["bidaClub"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "image": image,
        "price": price,
        "status": status,
        "bidaClubId": bidaClubId,
        "bidaClub": bidaClub,
      };
}

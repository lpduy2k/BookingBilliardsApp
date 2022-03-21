// To parse this JSON data, do
//
//     final getListHistoryRes = getListHistoryResFromJson(jsonString);

import 'dart:convert';

List<GetListHistoryRes> getListHistoryResFromJson(String str) =>
    List<GetListHistoryRes>.from(
        json.decode(str).map((x) => GetListHistoryRes.fromJson(x)));

String getListHistoryResToJson(List<GetListHistoryRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListHistoryRes {
  GetListHistoryRes({
    this.nameUser,
    this.idBooking,
    this.priceTable,
    this.timeBooking,
    this.totalPrice,
    this.bidaTableName,
    this.bidaClubName,
    this.imageTable,
    this.addressClub,
    this.status,
  });

  String? nameUser;
  String? idBooking;
  int? priceTable;
  DateTime? timeBooking;
  int? totalPrice;
  String? bidaTableName;
  String? bidaClubName;
  String? imageTable;
  String? addressClub;
  String? status;

  factory GetListHistoryRes.fromJson(Map<String, dynamic> json) =>
      GetListHistoryRes(
        nameUser: json["nameUser"],
        idBooking: json["idBooking"],
        priceTable: json["priceTable"],
        timeBooking: DateTime.parse(json["timeBooking"]),
        totalPrice: json["totalPrice"],
        bidaTableName: json["bidaTableName"],
        bidaClubName: json["bidaClubName"],
        imageTable: json["imageTable"],
        addressClub: json["addressClub"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "nameUser": nameUser,
        "idBooking": idBooking,
        "priceTable": priceTable,
        "timeBooking": timeBooking?.toIso8601String(),
        "totalPrice": totalPrice,
        "bidaTableName": bidaTableName,
        "bidaClubName": bidaClubName,
        "imageTable": imageTable,
        "addressClub": addressClub,
        "status": status,
      };

  static List<GetListHistoryRes> getListHistoryResFromJson(String str) =>
      List<GetListHistoryRes>.from(
          json.decode(str).map((x) => GetListHistoryRes.fromJson(x)));

  String getListHistoryResToJson(List<GetListHistoryRes> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

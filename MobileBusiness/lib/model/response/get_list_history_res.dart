// To parse this JSON data, do
//
//     final getListHistoryRes = getListHistoryResFromJson(jsonString);

import 'dart:convert';


class GetListHistoryRes {
    GetListHistoryRes({
        this.timeBooking,
        this.totalPrice,
        this.bidaTableName,
        this.bidaClubName,
        this.imageTable,
        this.addressClub,
    });

    DateTime? timeBooking;
    int? totalPrice;
    String? bidaTableName;
    String? bidaClubName;
    String? imageTable;
    String? addressClub;

    factory GetListHistoryRes.fromJson(Map<String, dynamic> json) => GetListHistoryRes(
        timeBooking: DateTime.parse(json["timeBooking"]),
        totalPrice: json["totalPrice"],
        bidaTableName: json["bidaTableName"],
        bidaClubName: json["bidaClubName"],
        imageTable: json["imageTable"],
        addressClub: json["addressClub"],
    );

    Map<String, dynamic> toJson() => {
        "timeBooking": timeBooking?.toIso8601String(),
        "totalPrice": totalPrice,
        "bidaTableName": bidaTableName,
        "bidaClubName": bidaClubName,
        "imageTable": imageTable,
        "addressClub": addressClub,
    };
    static List<GetListHistoryRes> getListHistoryResFromJson(String str) => List<GetListHistoryRes>.from(json.decode(str).map((x) => GetListHistoryRes.fromJson(x)));

    String getListHistoryResToJson(List<GetListHistoryRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

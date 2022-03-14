import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_detail_res.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/repository/bida_club_rep.dart';
import 'package:dio/dio.dart';

class BidaClubRepImpl implements BidaClubRepo {
  @override
  Future<List<GetBidaClubRes>> getBidaClub(String url) async {
    var result = [GetBidaClubRes()];
    try {
      Response response = await Dio().get(url);
      result = GetBidaClubRes.getBidaClubResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<GetBidaClubDetailRes> getBidaClubDetail(String url) async {
    var result = GetBidaClubDetailRes();
    try {
      Response response = await Dio().get(url);
      result = GetBidaClubDetailRes.getBidaClubDetailResFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

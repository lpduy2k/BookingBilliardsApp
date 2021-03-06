import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/upload_club_req.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/repository/bida_club_rep.dart';
import 'package:dio/dio.dart';

class BidaClubRepImpl implements BidaClubRepo {
  @override
  Future<GetBidaClubRes> getBidaClub(String url) async {
    var result = GetBidaClubRes();
    try {
      Response response = await Dio().get(url);
      result = GetBidaClubRes.getBidaClubResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<String> putClub(String url, UploadClubReq req) async {
    var result = '';
    try {
      await Dio().put(url, data: req.toJson());
      result = 'Upload success';
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

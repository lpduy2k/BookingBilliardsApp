import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/post_booking_req.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/post_booking_res.dart';
import 'package:dio/dio.dart';

import '../booking_rep.dart';

class BookingRepImpl implements BookingRepo {
  @override
  Future<List<GetListHistoryRes>> getListHistoryBooking(String url) async {
    var result = [GetListHistoryRes()];
    try {
      Response response = await Dio().get(url);
      result = GetListHistoryRes.getListHistoryResFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<PostBookingRes> postBooking(String url, PostBookingReq req) async {
    var result = PostBookingRes();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = PostBookingRes.postBookingResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

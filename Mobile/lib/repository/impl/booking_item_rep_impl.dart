import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/post_booking_item_req.dart';
import 'package:booking_billiards_app/model/response/post_booking_item_res.dart';
import 'package:booking_billiards_app/repository/booking_item_rep.dart';
import 'package:dio/dio.dart';

class BookingItemRepImpl implements BookingItemRepo {
  @override
  Future<PostBookingItemRes> postBookingItem(
      String url, PostBookingItemReq req) async {
    var result = PostBookingItemRes();
    try {
      Response response = await Dio().post(url, data: req.toJson());
      result = PostBookingItemRes.postBookingItemResFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

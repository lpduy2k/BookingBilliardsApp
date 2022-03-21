import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/repository/booking_rep.dart';
import 'package:dio/dio.dart';

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
}

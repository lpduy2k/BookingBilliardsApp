

import 'package:booking_billiards_app/model/request/post_booking_req.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/post_booking_res.dart';

abstract class BookingRepo {
  Future<List<GetListHistoryRes>> getListHistoryBooking(String url);
  Future<PostBookingRes> postBooking(String url, PostBookingReq req);
}
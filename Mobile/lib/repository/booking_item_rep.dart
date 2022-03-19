

import 'package:booking_billiards_app/model/request/post_booking_item_req.dart';
import 'package:booking_billiards_app/model/response/post_booking_item_res.dart';

abstract class BookingItemRepo {
  Future<PostBookingItemRes> postBookingItem(String url, PostBookingItemReq req);
}
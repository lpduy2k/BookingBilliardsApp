

import 'package:booking_billiards_app/model/response/get_list_history_res.dart';

abstract class BookingRepo {
  Future<List<GetListHistoryRes>> getListHistoryBooking(String url);
}
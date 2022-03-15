import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';

abstract class BidaTableRepo {
  Future<List<GetBidaTableRes>> getBidaTable(String url);
  Future<GetBidaTableRes> getBidaTableDetail(String url);
}
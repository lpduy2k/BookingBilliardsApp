import 'package:booking_billiards_app/model/request/create_table_req.dart';
import 'package:booking_billiards_app/model/request/upload_table_req.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';

abstract class BidaTableRepo {
  Future<List<GetBidaTableRes>> getBidaTable(String url);
  Future<GetBidaTableRes> getBidaTableDetail(String url);
  Future<String> putTable(String url, UploadTableReq req);
  Future<String> deleteTable(String url);
  Future<String> createTable(String url, CreateTableReq req);
}

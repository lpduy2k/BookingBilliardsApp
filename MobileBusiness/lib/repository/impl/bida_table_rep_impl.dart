import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/create_table_req.dart';
import 'package:booking_billiards_app/model/request/upload_table_req.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/repository/bida_table_rep.dart';
import 'package:dio/dio.dart';

class BidaTableRepImpl implements BidaTableRepo {
  @override
  Future<List<GetBidaTableRes>> getBidaTable(String url) async {
    var result = [GetBidaTableRes()];
    try {
      Response response = await Dio().get(url);
      result =
          GetBidaTableRes.getBidaTableResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<GetBidaTableRes> getBidaTableDetail(String url) async {
    var result = GetBidaTableRes();
    try {
      Response response = await Dio().get(url);
      result = GetBidaTableRes.getBidaTableDetailResFromJson(
          jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<String> putTable(String url, UploadTableReq req) async {
    var result = '';
    try {
      await Dio().put(url, data: req.toJson());
      result = 'Upload success';
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<String> deleteTable(String url) async {
    var result = '';
    try {
      await Dio().delete(url);
      result = 'Delete success';
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<String> createTable(String url, CreateTableReq req) async {
    var result = '';
    try {
      await Dio().post(url, data: req.toJson());
      result = 'add success';
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

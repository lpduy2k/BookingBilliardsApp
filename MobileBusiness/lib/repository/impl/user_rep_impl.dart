import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/upload_user_req.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/user_rep.dart';
import 'package:dio/dio.dart';

class UserRepImpl implements UserRepo {
  @override
  Future<GetUserRes> getUser(String url) async {
    var result = GetUserRes();
    try {
      Response response = await Dio().get(url);
      result = GetUserRes.getUserResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }

  @override
  Future<String> putUser(String url, UploadUserReq req) async {
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

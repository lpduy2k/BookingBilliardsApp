import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/response/sign_in_res.dart';
import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/repository/auth_rep.dart';
import 'package:dio/dio.dart';

class AuthRepImpl implements AuthRepo {
  @override
  Future<SignInRes> postSignIn(String url, SignInReq req) async {
    var result = SignInRes();
    try {
      Response response = await Dio().post(url + "/login", data: req.toJson());
      result = SignInRes.signInResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

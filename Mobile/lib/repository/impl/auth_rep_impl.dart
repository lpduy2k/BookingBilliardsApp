import 'dart:convert';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/sign_up_req.dart';
import 'package:booking_billiards_app/model/response/sign_in_res.dart';
import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/model/response/sign_up_res.dart';
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

  @override
  Future<SignUpRes> postSignUp(String url, SignUpReq req) async {
    var result = SignUpRes();
    try {
      Response response = await Dio().post(url + "/register", data: req);
      result = SignUpRes.signUpResFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

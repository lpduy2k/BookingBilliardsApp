import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/model/response/sign_in_res.dart';

abstract class AuthRepo {
  Future<SignInRes> postSignIn(String url, SignInReq req);
}

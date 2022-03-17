
import 'package:booking_billiards_app/model/request/upload_user_req.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';

abstract class UserRepo {
  Future<GetUserRes> getUser(String url);
  Future<String> putUser(String url, UploadUserReq req);
}
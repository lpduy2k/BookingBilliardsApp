import 'package:booking_billiards_app/model/request/upload_club_req.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';

abstract class BidaClubRepo {
  Future<GetBidaClubRes> getBidaClub(String url);
  Future<String> putClub(String url, UploadClubReq req);
}

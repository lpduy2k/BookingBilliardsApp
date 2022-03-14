import 'package:booking_billiards_app/model/response/get_bida_club_detail_res.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';

abstract class BidaClubRepo {
  Future<List<GetBidaClubRes>> getBidaClub(String url);
  Future<GetBidaClubDetailRes> getBidaClubDetail(String url);
}
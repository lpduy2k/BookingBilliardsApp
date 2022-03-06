import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';

abstract class BidaClubRepo {
  Future<List<GetBidaClubRes>> getBidaClub(String url);
}
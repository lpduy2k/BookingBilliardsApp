import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_detail_res.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/booking_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/view/bottomNavBar/bottomNavBar.dart';
import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/window_size.dart';

class ConfirmBooking extends StatefulWidget {
  GetBidaClubDetailRes? bidaClubDetail;
  String? timeBooking;
  ConfirmBooking({Key? key, this.bidaClubDetail, this.timeBooking})
      : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(1),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        body: SingleChildScrollView(
          child: Body(
              bidaClubDetail: widget.bidaClubDetail!,
              timeBooking: widget.timeBooking!),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final GetBidaClubDetailRes bidaClubDetail;
  final String timeBooking;
  const Body(
      {Key? key, required this.bidaClubDetail, required this.timeBooking})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SecureStorage secureStorage = SecureStorage();
    GetUserRes? user;
    List<GetListHistoryRes>? listHistory;
    final dateFormat = DateFormat("dd-MM-yyyy - KK:mm:ss");
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: windowHeight * windowSizeHeight(5),
                  bottom: windowHeight * windowSizeHeight(15),
                ),
              ),
              SizedBox(
                height: windowHeight * 0.05,
              ),
              const Text(
                'Billiards details',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(bidaClubDetail.name!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.pink,
                                size: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                              ),
                              Text(bidaClubDetail.address!),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.assistant_direction_outlined,
                              color: AppColor.pink,
                            ),
                            Text(
                              'Visit the billard',
                              style: TextStyle(color: AppColor.pink),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  bidaClubDetail.image!,
                  height: windowHeight * windowSizeHeight(180),
                ),
              ),
              SizedBox(
                height: windowHeight * 0.05,
              ),
              Text(
                "Successfully Booked Billiard Table",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.greenToast),
              ),
              SizedBox(
                height: windowHeight * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: AppColor.pink,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                              ),
                              Text(
                                'Time Booking',
                                style: TextStyle(color: AppColor.pink),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  dateFormat
                                      .format(DateTime.parse(timeBooking)),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: windowHeight * 0.05,
              ),
              ButtonDefault(
                  width: windowWidth * 0.8,
                  height: 49,
                  content: "Back To Home Screen",
                  color: AppColor.white,
                  backgroundBtn: AppColor.black,
                  voidCallBack: () async {
                    String userName =
                        await secureStorage.readSecureData("userName");
                    String userId =
                        await secureStorage.readSecureData("userId");
                    BidaClubRepImpl().getBidaClub(UrlApi.bidaClubPath).then(
                      (value) async {
                        await UserRepImpl()
                            .getUser(UrlApi.userPath + "/$userName")
                            .then((value) async {
                          user = value;
                        });
                        await BookingRepImpl()
                            .getListHistoryBooking(
                                UrlApi.bookingPath + "?userId=$userId")
                            .then((value) async {
                          listHistory = value;
                        });
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BottomNavBar(
                                  currentIndex: 0,
                                  listBidaClub: value,
                                  user: user,
                                  listHistory: listHistory!);
                            },
                          ),
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}

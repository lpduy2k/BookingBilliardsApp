import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/view/accountPage/account.dart';
import 'package:booking_billiards_app/view/clubProfile/club_profile.dart';
import 'package:booking_billiards_app/view/historyPage/history.dart';
import 'package:booking_billiards_app/view/table/tablelist.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  GetBidaClubRes? bidaClub;
  Home({Key? key, required this.bidaClub}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGreen,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.bidaClub!.name!,
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 85, 85),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xffa29aac),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GridDashboard(
            bidaClub: widget.bidaClub,
          ),
        ],
      ),
    );
  }
}

class GridDashboard extends StatelessWidget {
  GetBidaClubRes? bidaClub;
  GridDashboard({Key? key, required this.bidaClub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      AssetPath.club,
                      width: 90,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Billiard Club',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Info Your Club',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClubProfile(
                            bidaClub: bidaClub,
                          )),
                );
                print("click");
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.lightBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      AssetPath.order,
                      width: 70,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Club Order',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
                print("Click event on Container");
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.lightBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      AssetPath.table,
                      width: 120,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Table',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'See all table',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: () {
                BidaClubRepImpl()
                    .getBidaClubDetail(UrlApi.bidaClubPath +
                        "/f234efe9-3774-45f5-38ae-08d9db6c7456")
                    .then((value) async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TableListPage(
                      bidaClubDetail: value,
                    );
                  }));
                });
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      AssetPath.profile,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Check your profile',
                      style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                final SecureStorage secureStorage = SecureStorage();
                final username = await secureStorage.readSecureData("userName");

                UserRepImpl()
                    .getUser(UrlApi.userPath + "/$username")
                    .then((value) async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AccountPage(
                      user: value,
                    );
                  }));
                });
              },
            ),
          ]),
    );
  }
}

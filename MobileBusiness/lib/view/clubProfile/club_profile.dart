import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/providers/club_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/homePage/home.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubProfile extends StatelessWidget {
  GetBidaClubRes? bidaClub;
  ClubProfile({Key? key, required this.bidaClub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(1),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.lightGreen,
        body: SingleChildScrollView(
          child: Body(
            bidaClub: bidaClub,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  GetBidaClubRes? bidaClub;
  Body({Key? key, required this.bidaClub}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ClubPageProvider clubPageProvider = Provider.of<ClubPageProvider>(context);
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      // padding: EdgeInsets.only(
      //   top: windowHeight * windowSizeHeight(70),
      //   bottom: windowHeight * windowSizeHeight(35),
      // ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: windowHeight * windowSizeHeight(5),
              bottom: windowHeight * windowSizeHeight(15),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                BidaClubRepImpl()
                    .getBidaClub(UrlApi.bidaClubPath + "/${bidaClub!.id}")
                    .then((value) async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home(
                      bidaClub: value,
                    );
                  }));
                });
              },
            ),
          ),
          const Text(
            'Billiards Club',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
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
                          Text(bidaClub!.name!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                          Text(bidaClub!.address!),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: AppColor.black,
                      ),
                      Text(
                        bidaClub!.phoneNumber!,
                        style: TextStyle(
                          color: AppColor.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              bidaClub!.image!,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: AppColor.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          const Text('Opening hours'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(bidaClub!.timeOpen!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: AppColor.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          const Text('Closing hours'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(bidaClub!.timeClose!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.backup_table_sharp,
                    color: AppColor.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                  ),
                  const Text(
                    'Number of Tables :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                  ),
                  Text(
                    bidaClub!.quantity!.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Row(
            children: [
              const Text('Status : ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right),
              Text(bidaClub!.status!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          ButtonDefault(
            width: 100,
            height: 29,
            content: 'Edit',
            color: AppColor.white,
            backgroundBtn: AppColor.green,
            voidCallBack: () {
              clubPageProvider.addDataTable(
                  bidaClub!.id!,
                  bidaClub!.name!,
                  bidaClub!.address!,
                  bidaClub!.phoneNumber!,
                  bidaClub!.image!,
                  bidaClub!.timeOpen!,
                  bidaClub!.timeClose!,
                  bidaClub!.quantity!,
                  bidaClub!.status!,
                  bidaClub!.userId!);
              Navigator.of(context).pushNamed(
                '/editclubprofile',
              );
            },
          ),
        ],
      ),
    );
  }
}

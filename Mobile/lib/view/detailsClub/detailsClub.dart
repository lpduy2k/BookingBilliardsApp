import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_detail_res.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/detailsClub/card_bida.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:flutter/material.dart';

class DetailsClub extends StatefulWidget {
  final GetBidaClubDetailRes bidaClubDetail;
  const DetailsClub({
    Key? key,
    required this.bidaClubDetail,
  }) : super(key: key);

  @override
  State<DetailsClub> createState() => _DetailsClubState();
}

class _DetailsClubState extends State<DetailsClub> {
  List<GetBidaTableRes>? listBidaTable = [];
  @override
  void initState() {
    super.initState();
    BidaTableRepImpl()
        .getBidaTable(
            UrlApi.bidaTablePath + "?clubId=${widget.bidaClubDetail.id}")
        .then((value) async {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          if (value[i].status == "active") {
            listBidaTable?.add(value[i]);
          }
        }
      });
    });
  }

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
            bidaClubDetail: widget.bidaClubDetail,
            listBidaTable: listBidaTable!,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final GetBidaClubDetailRes bidaClubDetail;
  final List<GetBidaTableRes> listBidaTable;
  const Body({
    Key? key,
    required this.bidaClubDetail,
    required this.listBidaTable,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: windowHeight * windowSizeHeight(5),
              bottom: windowHeight * windowSizeHeight(15),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
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
                            color: AppColor.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          const Text('Time Booking'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              bidaClubDetail.timeOpen! +
                                  ' - ' +
                                  bidaClubDetail.timeClose!,
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
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'List table',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '  Check the table at there',
                          style: TextStyle(fontSize: 12, color: AppColor.black),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(color: AppColor.pink),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: AppColor.pink,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: windowHeight * windowSizeHeight(180),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: listBidaTable.length,
                    itemBuilder: (context, index) {
                      return CardBida(bidaTable: listBidaTable[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

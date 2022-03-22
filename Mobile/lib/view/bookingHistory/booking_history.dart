import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/view/detailsClub/detailsClub.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingHistory extends StatefulWidget {
  final List<GetListHistoryRes> listHistory;
  const BookingHistory({Key? key, required this.listHistory}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  final format = NumberFormat("#,##0,000");
  final dateFormat = DateFormat("dd-MM-yyyy - KK:mm:ss");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.lightGrey,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(
                0, size.height * 0.05, 0, size.height * 0.05),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Booking History",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18, height: 1.6),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                for (var list in widget.listHistory.reversed)
                  Card(
                    // color: AppColor.lightGreen,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      ListTile(
                        title: Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                list.imageTable!,
                                width: 150,
                                height: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    list.bidaTableName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        height: 1.6),
                                  ),
                                  const Text(
                                    'Time Booking: ',
                                    style: TextStyle(fontSize: 12, height: 1.6),
                                  ),
                                  Text(
                                    dateFormat.format(list.timeBooking!),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        height: 1.6),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(children: [
                            const Divider(
                              height: 2,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list.bidaClubName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          height: 1.6),
                                    ),
                                    Text(
                                      list.addressClub!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.6),
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      BidaClubRepImpl()
                                          .getBidaClubDetail(
                                              UrlApi.bidaClubPath +
                                                  "/${list.clubId}")
                                          .then((value) async {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailsClub(
                                            bidaClubDetail: value,
                                          );
                                        }));
                                      });
                                    },
                                    child: const Text(
                                      "Detail",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                    ))
                              ],
                            )
                          ]),
                        ),
                      ),
                    ]),
                  ),
              ],
            ),
          ),
        ));
  }
}

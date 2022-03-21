import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/view/historyPage/order_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  List<GetListHistoryRes>? listOrder;
  HistoryPage({Key? key, required this.listOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MM-yyyy - KK:mm:ss");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.lightGreen,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(
                0, size.height * 0.05, 0, size.height * 0.05),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                      child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/home");
                    },
                  )),
                ]), // Booking Active
                const Text(
                  "Booking List",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18, height: 1.6),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                for (var list in listOrder!)
                  Card(
                    // color: AppColor.lightGreen,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      ListTile(
                        title: Container(
                          // padding: EdgeInsets.fromLTRB(
                          //     0, size.height * 0.01, 0, size.height * 0.0001),
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                list.imageTable!,
                                width: 200,
                                height: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    list.bidaTableName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        height: 1.6),
                                  ),
                                  Text(
                                    dateFormat.format(list.timeBooking!),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.6),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(children: [
                            Container(
                              child: const Divider(
                                height: 2,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OrderDetailsPage()),
                                      );
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

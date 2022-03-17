import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/detailsClub/detailsClub.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
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
                              'https://media.istockphoto.com/photos/3d-rendering-of-an-isolated-billiard-table-in-a-top-view-with-a-full-picture-id945650288?k=20&m=945650288&s=170667a&w=0&h=p0tphNgA9OnGaOGYpwDYKE2MPV5SjmIkgupkmD6TOpE=',
                              width: 150,
                              height: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Total price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      height: 1.6),
                                ),
                                Text(
                                  '100.000',
                                  style: TextStyle(
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
                                children: const [
                                  Text(
                                    'Tên Quán',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        height: 1.6),
                                  ),
                                  Text(
                                    'Tên Bàn',
                                    style: TextStyle(
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
                                              const DetailsClub()),
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

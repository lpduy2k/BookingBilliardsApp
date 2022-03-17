import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
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
    
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(1),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
        body: const SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Booking History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            // tileColor: AppColor.white,
            iconColor: AppColor.black,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          SizedBox(
                  height: windowHeight * windowSizeHeight(100),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Card(
                        elevation: 8,
                        child: ListTile(
                          leading: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCR-s1OFav5Qn1MIUjAp3VE1FFIgohqJuauA&usqp=CAU',
                            width: windowWidth * windowSizeWidth(60),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ten quan",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "tien",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ten ban",
                                style: const TextStyle(fontSize: 10),
                              ),
                              Text(
                                "time",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          
                          
                        ),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
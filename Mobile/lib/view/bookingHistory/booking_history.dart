import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

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
                          const Text('Tên quán',
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
                          const Text('Tên bàn'),
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
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCR-s1OFav5Qn1MIUjAp3VE1FFIgohqJuauA&usqp=CAU',
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
                          const Text('Time using'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('10:00',
                              style: TextStyle(
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
                            Icons.price_check,
                            color: AppColor.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          const Text('Total price'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('100.000',
                              style: TextStyle(
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
        ],
      ),
    );
  }
}
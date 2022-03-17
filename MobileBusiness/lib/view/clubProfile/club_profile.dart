import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class ClubProfile extends StatelessWidget {
  const ClubProfile({Key? key}) : super(key: key);

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
                          const Text('F81 Billiard Club',
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
                          const Text('1 Quang Trung, Go Vap'),
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
                        '0839539151',
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
              'https://media-cdn.tripadvisor.com/media/photo-s/0d/c9/5b/eb/billiard-club-ripska.jpg',
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
                          const Text('08:00 AM',
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
                          const Text('12:00 PM',
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
                  const Text(
                    '15',
                    style: TextStyle(
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
            children: const [
              Text('Status : ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right),
              Text(' Active',
                  style: TextStyle(
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

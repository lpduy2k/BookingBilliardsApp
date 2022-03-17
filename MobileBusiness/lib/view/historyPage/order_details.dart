import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: size.height,
        margin:
            EdgeInsets.fromLTRB(0, size.height * 0.005, 0, size.height * 0.005),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
            ]),
            Row(
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                  flex: 6,
                  child: Text(
                    'Order Details',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18, height: 1.6),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: size.height * 0.3,
              width: size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://media.istockphoto.com/photos/3d-rendering-of-an-isolated-billiard-table-in-a-top-view-with-a-full-picture-id945650288?k=20&m=945650288&s=170667a&w=0&h=p0tphNgA9OnGaOGYpwDYKE2MPV5SjmIkgupkmD6TOpE=',
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                height: size.height * 0.35,
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Billiard Club's name:",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          'name',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightBlack,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Club address :",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          'location ',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Table Number",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          'Number',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightBlack,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time booking",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.lightBlack,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Divider(color: AppColor.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Timing",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              height: 1.6),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.access_alarm,
                              color: AppColor.green,
                              size: 24.0,
                            ),
                            Text(
                              'totalTime',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  height: 1.6,
                                  color: AppColor.green),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amount:",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          "100 VND",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.red,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status:",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          'status',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColor.green,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

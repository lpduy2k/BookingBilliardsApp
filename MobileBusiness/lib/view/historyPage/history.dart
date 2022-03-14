import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/view/historyPage/order_details.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.lightGreen,
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

                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
                OrderCard(),
              ],
            ),
          ),
        ));
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  width: 200,
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Table 15',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 1.6),
                    ),
                    Text(
                      '15:00PM',
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
                        'Địa chỉ',
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
                              builder: (context) => const OrderDetailsPage()),
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
    );
  }
}

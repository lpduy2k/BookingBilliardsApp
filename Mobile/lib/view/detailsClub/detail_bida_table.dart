import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/dialog/dialog_confirm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBidaTable extends StatelessWidget {
  final GetBidaTableRes bidaTableDetail;
  const DetailBidaTable({Key? key, required this.bidaTableDetail})
      : super(key: key);

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
          child: Body(bidaTableDetail: bidaTableDetail),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  final GetBidaTableRes bidaTableDetail;
  Body({Key? key, required this.bidaTableDetail}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat("#,##0,000");
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
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
          Text(
            widget.bidaTableDetail.name!,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                  Image.asset(
                    AssetPath.vip,
                    width: windowHeight * windowSizeHeight(50),
                  ),
                  Text(
                      widget.bidaTableDetail.status! == "active"
                          ? "Empty Table"
                          : "Full Table",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.greenToast),
                      textAlign: TextAlign.right),
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
              widget.bidaTableDetail.image!,
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
                            Icons.price_change,
                            color: AppColor.pink,
                            size: 40,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          Text(
                            format
                                    .format(widget.bidaTableDetail.price!)
                                    .toString() +
                                " VND/h",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: windowHeight * 0.05,
                      ),
                      Container(
                        width: windowWidth - windowWidth * windowSizeWidth(40),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              width: windowWidth,
                              decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Choose Time Booking",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: windowHeight * 0.01,
                                    ),
                                    Text(
                                      "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                                      style: const TextStyle(fontSize: 50),
                                    ),
                                    SizedBox(
                                      height: windowHeight * 0.01,
                                    ),
                                    ButtonDefault(
                                      width: 150,
                                      height: 29,
                                      content: 'Select Time',
                                      color: AppColor.white,
                                      backgroundBtn: AppColor.greenToast,
                                      voidCallBack: () async {
                                        TimeOfDay? newTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: time);
                                        if (newTime != null) {
                                          setState(() {
                                            time = newTime;
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: windowHeight * 0.03,
                            ),
                            DialogConfirm(
                                width: 100,
                                height: 49,
                                contentButton: 'BOOKING',
                                color: AppColor.white,
                                backgroundBtn: AppColor.black,
                                voidCallBack: () {
                                  print('thanh cong');
                                },
                                contentTitleDialog: 'Notification',
                                contentDialog:
                                    'Are you sure to book this table?')
                          ],
                        ),
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

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatelessWidget {
  final GetListHistoryRes? orderDetails;
  const OrderDetailsPage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MM-yyyy - KK:mm:ss");
    final priceFormat = NumberFormat("#,##0,000");
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
                const Expanded(
                  flex: 6,
                  child: Text(
                    'Order Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                    orderDetails!.imageTable!,
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
                          orderDetails!.bidaClubName!,
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
                          orderDetails!.addressClub!,
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
                          orderDetails!.bidaTableName!,
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
                          dateFormat.format(orderDetails!.timeBooking!),
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
                          "User Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              height: 1.6),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderDetails!.nameUser!,
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
                          "Price:",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          priceFormat.format(orderDetails!.priceTable),
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
                          "Booking ID:",
                          style: TextStyle(fontSize: 16, color: AppColor.black),
                        ),
                        Text(
                          orderDetails!.idBooking!,
                          style: TextStyle(
                              fontSize: 10,
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

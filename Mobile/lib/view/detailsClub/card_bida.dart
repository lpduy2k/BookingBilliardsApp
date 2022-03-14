
import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBida extends StatefulWidget {
  GetBidaTableRes? bidaTable;
  CardBida({Key? key, this.bidaTable}) : super(key: key);

  @override
  State<CardBida> createState() => _CardBidaState();
}

class _CardBidaState extends State<CardBida> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay time = TimeOfDay.now();

    Future pickTime() async {
      TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (newTime != null) {
        setState(() {
          time = newTime;
        });
      }
    }

    final format = NumberFormat("#,##0,000");
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8,
      child: ListTile(
        leading: Image.network(
          widget.bidaTable!.image!,
          width: windowWidth * windowSizeWidth(60),
        ),
        title: Text(
          widget.bidaTable!.name!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              format.format(widget.bidaTable!.price!).toString() + " VND/h",
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        trailing: ButtonDefault(
          width: 75,
          height: 25,
          content: 'Book',
          color: AppColor.white,
          backgroundBtn: AppColor.black,
          voidCallBack: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: SizedBox(
                          height: windowHeight * windowSizeHeight(100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Choose Arrival Time",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    pickTime();
                                  },
                                  child: const Text("Select Time"))
                            ],
                          )),
                    ));
          },
        ),
      ),
    );
  }
}

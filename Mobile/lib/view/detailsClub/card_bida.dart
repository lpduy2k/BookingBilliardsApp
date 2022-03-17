import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/detailsClub/detail_bida_table.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
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
            BidaTableRepImpl()
                .getBidaTableDetail(
                    UrlApi.bidaTablePath + "/${widget.bidaTable!.id!}")
                .then((value) async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailBidaTable(
                  bidaTableDetail: value,
                );
              }));
            });
          },
        ),
      ),
    );
  }
}

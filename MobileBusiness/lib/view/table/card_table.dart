import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/providers/table_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/table/edit_table.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardBida extends StatefulWidget {
  GetBidaTableRes? bidaTable;
  CardBida({Key? key, this.bidaTable}) : super(key: key);

  @override
  State<CardBida> createState() => _CardBidaState();
}

class _CardBidaState extends State<CardBida> {
  @override
  Widget build(BuildContext context) {
    TablePageProvider tablePageProvider =
        Provider.of<TablePageProvider>(context);
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
            const Text(
              "Status:",
              style: TextStyle(fontSize: 10),
            ),
            Text(
              widget.bidaTable!.status!,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        trailing: ButtonDefault(
          width: 100,
          height: 25,
          content: 'Details',
          color: AppColor.white,
          backgroundBtn: AppColor.lightBlue,
          voidCallBack: () {
            // BidaTableRepImpl()
            //     .getBidaTableDetail(
            //         UrlApi.bidaTablePath + "/${widget.bidaTable!.id!}")
            //     .then((value) async {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return EditTablePage(
            //       // bidaTableDetail: value,
            //     );
            //   }));
            // });
            // print(widget.bidaTable!.id);

            tablePageProvider.addDataTable(
                widget.bidaTable!.id!,
                widget.bidaTable!.image!,
                widget.bidaTable!.name!,
                widget.bidaTable!.price!,
                widget.bidaTable!.type!,
                widget.bidaTable!.status!,
                widget.bidaTable!.bidaClubId!);
            Navigator.of(context).pushNamed(
              '/tableDetailsPage',
            );
          },
        ),
      ),
    );
  }
}

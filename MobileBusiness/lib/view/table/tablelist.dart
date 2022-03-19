import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_detail_res.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/table/add_table.dart';
import 'package:booking_billiards_app/view/table/card_table.dart';
import 'package:booking_billiards_app/view/table/edit_table.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class TableListPage extends StatefulWidget {
  final GetBidaClubDetailRes bidaClubDetail;
  const TableListPage({
    Key? key,
    required this.bidaClubDetail,
  }) : super(key: key);

  @override
  State<TableListPage> createState() => _TableListPageState();
}

class _TableListPageState extends State<TableListPage> {
  List<GetBidaTableRes>? listBidaTable = [];
  @override
  void initState() {
    super.initState();
    BidaTableRepImpl()
        .getBidaTable(
            UrlApi.bidaTablePath + "?clubId=${widget.bidaClubDetail.id}")
        .then((value) async {
      setState(() {
        for (var i = 0; i < value.length; i++) {
          if (value[i].status == "active") {
            listBidaTable?.add(value[i]);
          }
        }
      });
    });
  }

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
        body: SingleChildScrollView(
          child: Body(
            bidaClubDetail: widget.bidaClubDetail,
            listBidaTable: listBidaTable!,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final GetBidaClubDetailRes bidaClubDetail;
  final List<GetBidaTableRes> listBidaTable;
  const Body({
    Key? key,
    required this.bidaClubDetail,
    required this.listBidaTable,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

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
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconColor: AppColor.black,
          ),
          const Text(
            'List table',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'All table in your Club',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddTablePage()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Add table',
                            style: TextStyle(color: AppColor.green),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColor.green,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: windowHeight * windowSizeHeight(400),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listBidaTable.length,
                    itemBuilder: (context, index) {
                      return CardBida(bidaTable: listBidaTable[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

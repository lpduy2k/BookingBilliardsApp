import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/table/add_table.dart';
import 'package:booking_billiards_app/view/table/edit_table.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class TableListPage extends StatelessWidget {
  final GetBidaTableRes bidaTable;
  TableListPage({Key? key, required this.bidaTable}) : super(key: key);

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
            bidaTable: bidaTable,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final GetBidaTableRes bidaTable;
  const Body({Key? key, required this.bidaTable}) : super(key: key);
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
                      children: [
                        const Text(
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
                  height: windowHeight * windowSizeHeight(100),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Card(
                        elevation: 8,
                        child: ListTile(
                          leading: Image.network(
                            bidaTable!.image!,
                            width: windowWidth * windowSizeWidth(60),
                          ),
                          title: Text(
                            bidaTable.name!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: const [
                              Text(
                                "Status:",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                "xxx",
                                style: TextStyle(fontSize: 10),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditTablePage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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

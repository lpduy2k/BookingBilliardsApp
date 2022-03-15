import 'dart:async';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/view/detailsClub/detailsClub.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:booking_billiards_app/widgets/input/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBidaClub extends StatefulWidget {
  const SearchBidaClub({Key? key}) : super(key: key);

  @override
  State<SearchBidaClub> createState() => _SearchBidaClubState();
}

class _SearchBidaClubState extends State<SearchBidaClub> {
  List<GetBidaClubRes> bidaClubs = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final bidaClubs =
        await BidaClubRepImpl().searchBidaClub(UrlApi.bidaClubPath, query);

    setState(() => this.bidaClubs = bidaClubs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bida Club'),
        centerTitle: true,
        backgroundColor: AppColor.black,
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: bidaClubs.length,
              itemBuilder: (context, index) {
                final bidaClub = bidaClubs[index];
                return buildBidaClub(bidaClub);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search',
        onChanged: searchBidaClub,
      );

  Future searchBidaClub(String query) async => debounce(() async {
        final bidaClubs =
            await BidaClubRepImpl().searchBidaClub(UrlApi.bidaClubPath, query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.bidaClubs = bidaClubs;
        });
      });

  Widget buildBidaClub(GetBidaClubRes bidaClub) => InkWell(
        onTap: () {
          BidaClubRepImpl()
              .getBidaClubDetail(UrlApi.bidaClubPath + "/${bidaClub.id}")
              .then((value) async {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsClub(
                bidaClubDetail: value,
              );
            }));
          });
        },
        child: ListTile(
          leading: Image.network(
            bidaClub.image!,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text(bidaClub.name!),
          subtitle: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.mapMarkerAlt,
                size: 15,
                color: AppColor.pink,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 3),
              ),
              Text(bidaClub.address!),
            ],
          ),
        ),
      );
}

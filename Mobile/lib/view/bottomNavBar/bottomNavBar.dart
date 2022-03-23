import 'dart:developer';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/view/accountPage/account.dart';
import 'package:booking_billiards_app/view/bookingHistory/booking_history.dart';
import 'package:booking_billiards_app/view/detailsClub/detailsClub.dart';
import 'package:booking_billiards_app/view/home/home.dart';
import 'package:booking_billiards_app/view/success/success.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex = 0; 
  final List<GetBidaClubRes> listBidaClub;
  final GetUserRes? user;
  final List<GetListHistoryRes> listHistory;
  BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.listBidaClub,
    required this.user,
    required this.listHistory
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var screens = [];
  @override
  void initState() {
    super.initState();
    screens = [
      Home(listBidaClub: widget.listBidaClub), //nhap home , booking , account
      BookingHistory(listHistory:widget.listHistory),
      AccountPage(user: widget.user!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      body: screens[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) => setState(() => widget.currentIndex = index),
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.lightGrey,
        backgroundColor: AppColor.white,
        iconSize: 30,
        selectedFontSize: 13,
        showUnselectedLabels: false,
        // showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chair_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_sharp),
            label: 'Booking History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

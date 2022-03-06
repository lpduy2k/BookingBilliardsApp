import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/view/accountPage/account.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/home/home.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<GetBidaClubRes> listBidaClub;
  const BottomNavBar({
    Key? key,
    required this.listBidaClub,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var screens = [];
  @override
  void initState() {
    screens = [
      Home(listBidaClub: widget.listBidaClub), //nhap home , booking , account
      InputPinCode(),
      AccountPage(),
    ];
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
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
            label: 'Booking',
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

import 'package:booking_billiards_app/configs/themes/app_color.dart';

import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/forgetPassword/success_forget_password.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // final ScrollController _controller = ScrollController();
  // late final ScrollListener _model;

  // BottomNavBar() {
  //   _model = ScrollListener.initialise(_controller);
  // }

  int currentIndex = 0;
  final screens = const [
    SuccessForgetPassword(), //nhap home , booking , account
    InputPinCode(),
    ForgetPassword(),
  ];

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

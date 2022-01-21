import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _pageState = 0;

  var _backgroundColor = AppColor.white;

  double _registerYOffset = 0;
  double _loginYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        _backgroundColor = AppColor.white;
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = AppColor.black;
        _registerYOffset = 100;
        _loginYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = AppColor.black;
        _registerYOffset = windowHeight;
        _loginYOffset = 100;
        break;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 0;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 1000),
                color: _backgroundColor,
                width: double.infinity,
                height: windowHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Image.asset(AssetPath.logo),
                    ),
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                          'Welcome',
                          style: AppTextStyles.h2Black,
                          textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Before Enjoying Foodmedia Services Please Register First',
                          style: AppTextStyles.h4Grey,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonDefault(
                              content: 'Create Account',
                              color: AppColor.white,
                              backgroundBtn: AppColor.black,
                              voidCallBack: () {
                                setState(() {
                                  if (_pageState != 0) {
                                    _pageState = 0;
                                  } else {
                                    _pageState = 1;
                                  }
                                });
                              }),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ButtonDefault(
                              content: 'Login',
                              color: AppColor.pink,
                              backgroundBtn: AppColor.black,
                              voidCallBack: () {
                                setState(() {
                                  if (_pageState != 0) {
                                    _pageState = 0;
                                  } else {
                                    _pageState = 2;
                                  }
                                });
                              }),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      'By Logging In Or Registering, You Have Agreed To',
                                  style: AppTextStyles.h6Black,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' The Terms And Conditions',
                                        style: AppTextStyles.h6Pink,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' And',
                                              style: AppTextStyles.h6Black,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: ' Privacy Policy.',
                                                    style: AppTextStyles.h6Pink)
                                              ])
                                        ])
                                  ])),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 1;
              });
            },
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 2;
              });
            },
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          )
        ],
      ),
    );
  }
}

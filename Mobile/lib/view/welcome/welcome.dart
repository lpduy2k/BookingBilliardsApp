import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
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
        _backgroundColor = AppColor.lightBlack;
        _registerYOffset = 184;
        _loginYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = AppColor.lightBlack;
        _registerYOffset = windowHeight;
        _loginYOffset = 239;
        break;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 0;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                  milliseconds: 1000,
                ),
                color: _backgroundColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: double.infinity,
                height: windowHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(AssetPath.logo),
                    Column(children: <Widget>[
                      Text(
                        'Welcome',
                        style: AppTextStyles.h2Black,
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                      ),
                      Text(
                        'Before Enjoying Foodmedia Services Please Register First',
                        style: AppTextStyles.h4Grey,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonDefault(
                            content: 'Create Account',
                            height: 49,
                            width: double.infinity,
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
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                        ),
                        ButtonDefault(
                            content: 'Login',
                            height: 49,
                            width: double.infinity,
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
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                        ),
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
                                        style: AppTextStyles.h6Pink,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.all(10),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 1000,
              ),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColor.pink,
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                          'Create Account',
                          style: AppTextStyles.h3Pink,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            child: Text(
                              'Phone Number',
                              style: AppTextStyles.h3Black,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Eg: 0333xxx.xxx',
                                hintStyle: AppTextStyles.h4Grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            child: Text(
                              'Password',
                              style: AppTextStyles.h3Black,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '••••••••••',
                                hintStyle: AppTextStyles.h4Grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            child: Text(
                              'Confirm Password',
                              style: AppTextStyles.h3Black,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '••••••••••',
                                hintStyle: AppTextStyles.h4Grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ButtonDefault(
                          content: 'Registration',
                          height: 49,
                          width: double.infinity,
                          color: AppColor.white,
                          backgroundBtn: AppColor.black,
                          voidCallBack: () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.google),
                          label: Text(
                            'Sign up with Google',
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.lightGrey),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.all(10),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 1000,
              ),
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColor.pink,
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Login',
                          style: AppTextStyles.h3Pink,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            child: Text(
                              'Phone Number',
                              style: AppTextStyles.h3Black,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Eg: 0333xxx.xxx',
                                hintStyle: AppTextStyles.h4Grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 5,
                            ),
                            child: Text(
                              'Password',
                              style: AppTextStyles.h3Black,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: '••••••••••',
                                hintStyle: AppTextStyles.h4Grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            style: AppTextStyles.h4Pink,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ButtonDefault(
                          content: 'Login',
                          height: 49,
                          width: double.infinity,
                          color: AppColor.white,
                          backgroundBtn: AppColor.black,
                          voidCallBack: () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.google),
                          label: Text(
                            'Login with Google',
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.lightGrey),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

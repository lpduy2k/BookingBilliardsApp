import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: AppColor.white,
      width: double.infinity,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Image.asset(AssetPath.logo),
          ),
          Container(
            child: Column(
              children: <Widget>[
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
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonDefault(
                  content: 'Create Account',
                  color: AppColor.white,
                  backgroundBtn: AppColor.black,
                  voidCallBack: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                ButtonDefault(
                  content: 'Login',
                  color: AppColor.pink,
                  backgroundBtn: AppColor.black,
                  voidCallBack: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                ButtonDefault(
                  content: 'Forget Password',
                  color: AppColor.white,
                  backgroundBtn: AppColor.black,
                  voidCallBack: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgetPassword();
                        },
                      ),
                    );
                  },
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By Logging In Or Registering, You Have Agreed To',
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

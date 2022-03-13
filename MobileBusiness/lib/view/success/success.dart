import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(20),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: const SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
        top: windowHeight * windowSizeHeight(200),
        bottom: windowHeight * windowSizeHeight(30),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(AssetPath.success),
              Text(
                'Success',
                style: AppTextStyles.h1Black,
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: windowWidth * windowSizeWidth(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ],
          ),
          ButtonDefault(
            width: double.infinity,
            height: 49,
            content: 'Sign In',
            color: AppColor.white,
            backgroundBtn: AppColor.green,
            voidCallBack: () {
              Navigator.of(context).pushNamed(
                '/welcome',
              );
            },
          ),
        ],
      ),
    );
  }
}

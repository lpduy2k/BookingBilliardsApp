import 'dart:async';
import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/view/onboarding/intro_slider.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IntroSliderPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.white,
      width: double.infinity,
      height: size.height,
      child: Column(
        //alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.05,
            child: Image.asset(AssetPath.logo),
          ),
          CircularProgressIndicator(
            color: AppColor.pink,
          ),
        ],
      ),
    );
  }
}

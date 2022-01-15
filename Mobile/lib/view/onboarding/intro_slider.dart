import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/view/onboarding/data_onboarding.dart';
import 'package:booking_billiards_app/view/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataOnboarding.forEach((slide) => {
          slides.add(
            new Slide(
              title: slide.title,
              maxLineTitle: 2,
              styleTitle: AppTextStyles.h2Black,
              description: slide.description,
              styleDescription: AppTextStyles.h4Grey,
              pathImage: slide.pathImage,
              backgroundColor: AppColor.white,
            ),
          )
        });
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: Text(
        'Skip',
        style: TextStyle(color: AppColor.grey),
      ),
      skipButtonStyle: dotButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: dotButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      doneButtonStyle: dotButtonStyle(),
      onDonePress: this.onDonePress,

      // Dot indicator
      colorDot: AppColor.lightGrey,
      colorActiveDot: AppColor.black,
      sizeDot: 8.0,
    );
  }
}

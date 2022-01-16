import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:flutter/material.dart';

class Slides {
  final String title, description, pathImage;

  const Slides({
    required this.title,
    required this.description,
    required this.pathImage,
  });
}

List<Slides> dataOnboarding = [
  Slides(
      title: "Nearby Billiardsssssssss",
      description:
          "You don't have to go far to find a club billiards, we have provided all the club billiards that is near you",
      pathImage: AssetPath.slideOne),
  Slides(
      title: "Select The Club Billiards",
      description:
          "You choose club billiards and select time to book to avoid when going to club billiards but don't have empty table",
      pathImage: AssetPath.slideTwo),
];

ButtonStyle dotButtonStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
    overlayColor: MaterialStateProperty.all<Color>(AppColor.lightBlack),
  );
}

Widget renderNextBtn() {
  return Image.asset(
    AssetPath.nextSlide,
    width: 24,
    height: 24,
  );
}

Widget renderDoneBtn() {
  return Icon(
    Icons.done,
    color: AppColor.black,
  );
}

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:flutter/material.dart';

void Loading(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
          child: CircularProgressIndicator(
        color: AppColor.pink,
      ));
    });

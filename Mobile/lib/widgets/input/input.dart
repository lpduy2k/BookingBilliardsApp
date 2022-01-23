import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class InputDefault extends StatelessWidget {
  const InputDefault({
    Key? key,
    //required this.width,
  }) : super(key: key);
  // final double width;
  // final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 5,
          ),
          child: Text(
            'Full Name',
            style: AppTextStyles.h3Black,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextField(
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
              hintText: 'Enter you full name',
              hintStyle: AppTextStyles.h4Grey,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class ChangeNewPassword extends StatelessWidget {
  const ChangeNewPassword({Key? key}) : super(key: key);

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
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: windowHeight,
      padding: EdgeInsets.only(
        top: windowHeight * windowSizeHeight(100),
        bottom: windowHeight * windowSizeHeight(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Change New Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(10),
              ),
              Text(
                'Enter a different password with the previous',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(30),
              ),
              const InputForm(
                label: 'New Password',
                obscureText: true,
              ),
              const InputForm(
                label: 'Confirm Password',
                obscureText: true,
              ),
            ],
          ),
          ButtonDefault(
            backgroundBtn: AppColor.black,
            color: AppColor.white,
            content: 'Submit',
            height: 49,
            width: double.infinity,
            voidCallBack: () {},
          ),
        ],
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.label,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final bool obscureText;

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
            label,
            style: AppTextStyles.h3Black,
          ),
        ),
        SizedBox(
          height: 70,
          width: double.infinity,
          child: TextField(
            obscureText: obscureText,
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
    );
  }
}

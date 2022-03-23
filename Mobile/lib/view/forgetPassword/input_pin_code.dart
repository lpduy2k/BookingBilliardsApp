import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';

import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view_model/providers/input_pin_code_provider.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputPinCode extends StatelessWidget {
  const InputPinCode({Key? key}) : super(key: key);

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

    InputPinCodeProvider inputPinCodeProvider =
        Provider.of<InputPinCodeProvider>(context);

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
              const Text(
                'Enter verification code',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: windowWidth * windowSizeWidth(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        controller: inputPinCodeProvider.input1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          counterText: '',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        controller: inputPinCodeProvider.input2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          counterText: '',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        controller: inputPinCodeProvider.input3Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          counterText: '',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        controller: inputPinCodeProvider.input4Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(30),
              ),
              RichText(
                text: TextSpan(
                  text: 'Didn\'t receive code?',
                  style: AppTextStyles.h4Grey,
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Resend',
                        style: AppTextStyles.h4Pink,
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ],
          ),
          ButtonDefault(
            width: double.infinity,
            height: 49,
            content: 'Confirm',
            color: AppColor.white,
            backgroundBtn: AppColor.black,
            voidCallBack: () {
              inputPinCodeProvider.submitData(context);
            },
          ),
        ],
      ),
    );
  }
}

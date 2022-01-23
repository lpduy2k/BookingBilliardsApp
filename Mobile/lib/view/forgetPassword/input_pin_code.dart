import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/forgetPassword/change_new_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                  children: const [
                    InputCode(),
                    InputCode(),
                    InputCode(),
                    InputCode(),
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
          SizedBox(
            height: 49,
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColor.black,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangeNewPassword();
                    },
                  ),
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputCode extends StatelessWidget {
  const InputCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      child: TextField(
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          counterText: '',
        ),
      ),
    );
  }
}

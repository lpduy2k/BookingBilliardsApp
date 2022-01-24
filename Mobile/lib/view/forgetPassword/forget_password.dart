import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/welcome/welcome.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                'Forget Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(10),
              ),
              Text(
                'Enter your registered phone number below',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.grey,
                ),
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(80),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      left: 10,
                      bottom: 5,
                    ),
                    child: Text(
                      'Phone Number',
                      style: AppTextStyles.h3Black,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: TextField(
                      keyboardType: TextInputType.number,
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
                        hintText: 'Eg: 0333xxx.xxx',
                        hintStyle: AppTextStyles.h4Grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(10),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: windowHeight * windowSizeHeight(10),
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Remember the password?',
                    style: AppTextStyles.h4Grey,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign in',
                          style: AppTextStyles.h4Pink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomePage(),
                                ),
                              );
                            })
                    ],
                  ),
                ),
              ),
            ],
          ),
          ButtonDefault(
            backgroundBtn: AppColor.black,
            color: AppColor.white,
            content: 'Submit',
            height: 49,
            width: double.infinity,
            voidCallBack: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InputPinCode(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

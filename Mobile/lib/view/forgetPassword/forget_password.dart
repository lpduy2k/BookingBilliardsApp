import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: const Body(),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      padding: const EdgeInsets.only(top: 100, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter your registered phone number below',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Eg: 0333xxx.xxx',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: AppColor.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                    borderSide: BorderSide(
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Text('Remember the password ?'),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColor.pink,
                      ),
                    ),
                  ),
                ],
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

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class ChangeNewPassword extends StatelessWidget {
  const ChangeNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.white,
      child: const Scaffold(
        body: Body(),
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
    return Container(
      padding: const EdgeInsets.only(top: 100, bottom: 30),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter a different password with the previous',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const InputForm(
                label: 'New Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
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
            hintText: '*********',
          ),
        ),
      ],
    );
  }
}

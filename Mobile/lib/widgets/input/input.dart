import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class ValidationItem {
  final String? value;
  final String? error;
  ValidationItem(this.value, this.error);
}

class InputDefault extends StatelessWidget {
  const InputDefault({
    Key? key,
    required this.title,
    required this.suffixIcon,
    required this.hintText,
    required this.errorText,
    required this.autofocus,
    required this.obscureText,
    required this.keyboardType,
    required this.textInputAction,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
    required this.onEditingComplete,
  }) : super(key: key);
  final String title;
  final Widget? suffixIcon;
  final String hintText;
  final String? errorText;
  final bool autofocus;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;

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
            title,
            style: AppTextStyles.h3Black,
          ),
        ),
        SizedBox(
          height: 70,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
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
              hintText: hintText,
              hintStyle: AppTextStyles.h4Grey,
              errorText: errorText,
            ),
            autofocus: autofocus,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction, // thay doi phim
            controller: controller, // dieu khien
            onChanged: onChanged,
            focusNode: focusNode, // focus xuong dong
            onEditingComplete: onEditingComplete,
          ),
        ),
      ],
    );
  }
}

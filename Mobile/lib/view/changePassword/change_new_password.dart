import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view_model/providers/change_pass_provider.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    ChangePassProvider changPassProvider =
        Provider.of<ChangePassProvider>(context);
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
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
              InputDefault(
                title: 'Old Password',
                suffixIcon: changPassProvider.textPasswordOld.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () =>
                                changPassProvider.clearPasswordOldController(),
                            icon: const Icon(Icons.clear_rounded),
                            color: AppColor.pink,
                          ),
                          IconButton(
                            onPressed: () =>
                                changPassProvider.changePasswordOldVariable(),
                            icon: changPassProvider.isPasswordOldVariable
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColor.pink,
                          ),
                        ],
                      )
                    : null,
                hintText: '••••••••••',
                errorText: changPassProvider.passwordOld.error,
                autofocus: false,
                obscureText: changPassProvider.isPasswordOldVariable,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: changPassProvider.passwordOldController,
                onChanged: (String value) {
                  changPassProvider.checkPasswordOld(value);
                },
                focusNode: changPassProvider.passwordOldFocus,
                onEditingComplete: () {
                  changPassProvider.changeFocus(context, 'passwordOld');
                },
              ),
              const SizedBox(
                height: 5,
              ),
              InputDefault(
                title: 'New Password',
                suffixIcon: changPassProvider.textPasswordNew.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () =>
                                changPassProvider.clearPasswordNewController(),
                            icon: const Icon(Icons.clear_rounded),
                            color: AppColor.pink,
                          ),
                          IconButton(
                            onPressed: () =>
                                changPassProvider.changePasswordNewVariable(),
                            icon: changPassProvider.isPasswordNewVariable
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColor.pink,
                          ),
                        ],
                      )
                    : null,
                hintText: '••••••••••',
                errorText: changPassProvider.passwordNew.error,
                autofocus: false,
                obscureText: changPassProvider.isPasswordNewVariable,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: changPassProvider.passwordNewController,
                onChanged: (String value) {
                  changPassProvider.checkPasswordNew(value);
                },
                focusNode: changPassProvider.passwordNewFocus,
                onEditingComplete: () {
                  changPassProvider.changeFocus(context, 'passwordNew');
                },
              ),
              const SizedBox(
                height: 5,
              ),
              InputDefault(
                title: 'Confirm New Password',
                suffixIcon: changPassProvider.textConfirm.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () =>
                                changPassProvider.clearConfirmController(),
                            icon: const Icon(Icons.clear_rounded),
                            color: AppColor.pink,
                          ),
                          IconButton(
                            onPressed: () =>
                                changPassProvider.changeConfirmVariable(),
                            icon: changPassProvider.isConfirmVariable
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColor.pink,
                          ),
                        ],
                      )
                    : null,
                hintText: '••••••••••',
                errorText: changPassProvider.confirm.error,
                autofocus: false,
                obscureText: changPassProvider.isConfirmVariable,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: changPassProvider.confirmController,
                onChanged: (String value) {
                  changPassProvider.checkConfirm(value);
                },
                focusNode: changPassProvider.confirmFocus,
                onEditingComplete: () {
                  changPassProvider.changeFocus(context, 'confirm');
                },
              ),
            ],
          ),
          ButtonDefault(
            backgroundBtn: AppColor.black,
            color: AppColor.white,
            content: 'Submit',
            height: 49,
            width: double.infinity,
            voidCallBack: () {
              changPassProvider.submitData(context);
            },
          ),
        ],
      ),
    );
  }
}

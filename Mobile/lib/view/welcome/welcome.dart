import 'package:booking_billiards_app/configs/themes/app_color.dart';

import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/view_model/providers/sign_in_provider.dart';
import 'package:booking_billiards_app/view_model/providers/sign_up_provider.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _pageState = 0;

  var _backgroundColor = AppColor.white;

  double _registerYOffset = 0;
  double _loginYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        _backgroundColor = AppColor.white;
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = AppColor.lightBlack;
        _registerYOffset = windowHeight - 474;
        _loginYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = AppColor.lightBlack;
        _registerYOffset = windowHeight;
        _loginYOffset = windowHeight - 397;
        break;
    }

    SignInProvider signInProvider = Provider.of<SignInProvider>(context);

    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _pageState = 0;
                  if (signInProvider.phone.error != null) {
                    signInProvider.clearPhoneController();
                  }
                  if (signUpProvider.phone.error != null) {
                    signUpProvider.clearPhoneController();
                  }
                  signInProvider.clearPasswordController();
                  signUpProvider.clearPasswordController();
                  signUpProvider.clearConfirmController();
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                  milliseconds: 1000,
                ),
                color: _backgroundColor,
                padding: EdgeInsets.symmetric(
                  horizontal: windowWidth * windowSizeWidth(20),
                ),
                width: double.infinity,
                height: windowHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(AssetPath.logo),
                    Column(children: <Widget>[
                      Text(
                        'Welcome',
                        style: AppTextStyles.h2Black,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: windowHeight * windowSizeHeight(10),
                        ),
                      ),
                      Text(
                        'Before Enjoying Foodmedia Services Please Register First',
                        style: AppTextStyles.h4Grey,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonDefault(
                            content: 'Create Account',
                            height: 49,
                            width: double.infinity,
                            color: AppColor.white,
                            backgroundBtn: AppColor.black,
                            voidCallBack: () {
                              setState(() {
                                if (_pageState != 0) {
                                  _pageState = 0;
                                } else {
                                  _pageState = 1;
                                }
                              });
                            }),
                        Padding(
                          padding: EdgeInsets.only(
                            top: windowHeight * windowSizeHeight(10),
                          ),
                        ),
                        ButtonDefault(
                            content: 'Login',
                            height: 49,
                            width: double.infinity,
                            color: AppColor.pink,
                            backgroundBtn: AppColor.black,
                            voidCallBack: () {
                              setState(() {
                                if (_pageState != 0) {
                                  _pageState = 0;
                                } else {
                                  _pageState = 2;
                                }
                              });
                            }),
                        Padding(
                          padding: EdgeInsets.only(
                            top: windowHeight * windowSizeHeight(10),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'By Logging In Or Registering, You Have Agreed To',
                            style: AppTextStyles.h6Black,
                            children: <TextSpan>[
                              TextSpan(
                                text: ' The Terms And Conditions',
                                style: AppTextStyles.h6Pink,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' And',
                                    style: AppTextStyles.h6Black,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Privacy Policy.',
                                        style: AppTextStyles.h6Pink,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: windowHeight * windowSizeHeight(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.all(10),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 1000,
              ),
              transform: Matrix4.translationValues(0, _registerYOffset, 1),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColor.pink,
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                          'Create Account',
                          style: AppTextStyles.h3Pink,
                        ),
                      ),
                      InputDefault(
                        title: 'Phone Number',
                        suffixIcon: signUpProvider.textPhone.isNotEmpty
                            ? IconButton(
                                onPressed: () =>
                                    signUpProvider.clearPhoneController(),
                                icon: const Icon(Icons.clear_rounded),
                                color: AppColor.pink,
                              )
                            : null,
                        hintText: 'Eg: 0333xxx.xxx',
                        errorText: signUpProvider.phone.error,
                        autofocus: false,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        controller: signUpProvider.phoneController,
                        onChanged: (String value) {
                          signUpProvider.checkPhone(value);
                        },
                        focusNode: signUpProvider.phoneFocus,
                        onEditingComplete: () {
                          signUpProvider.changeFocus(context, 'phone');
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InputDefault(
                        title: 'Password',
                        suffixIcon: signUpProvider.textPassword.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () => signUpProvider
                                        .clearPasswordController(),
                                    icon: const Icon(Icons.clear_rounded),
                                    color: AppColor.pink,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        signUpProvider.changePasswordVariable(),
                                    icon: signUpProvider.isPasswordVariable
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    color: AppColor.pink,
                                  ),
                                ],
                              )
                            : null,
                        hintText: '••••••••••',
                        errorText: signUpProvider.password.error,
                        autofocus: false,
                        obscureText: signUpProvider.isPasswordVariable,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: signUpProvider.passwordController,
                        onChanged: (String value) {
                          signUpProvider.checkPassword(value);
                        },
                        focusNode: signUpProvider.passwordFocus,
                        onEditingComplete: () {
                          signUpProvider.changeFocus(context, 'password');
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InputDefault(
                        title: 'Confirm Password',
                        suffixIcon: signUpProvider.textConfirm.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () =>
                                        signUpProvider.clearConfirmController(),
                                    icon: const Icon(Icons.clear_rounded),
                                    color: AppColor.pink,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        signUpProvider.changeConfirmVariable(),
                                    icon: signUpProvider.isConfirmVariable
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    color: AppColor.pink,
                                  ),
                                ],
                              )
                            : null,
                        hintText: '••••••••••',
                        errorText: signUpProvider.confirm.error,
                        autofocus: false,
                        obscureText: signUpProvider.isConfirmVariable,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: signUpProvider.confirmController,
                        onChanged: (String value) {
                          signUpProvider.checkConfirm(value);
                        },
                        focusNode: signUpProvider.confirmFocus,
                        onEditingComplete: () {
                          signUpProvider.changeFocus(context, 'confirm');
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ButtonDefault(
                        content: 'Registration',
                        height: 49,
                        width: double.infinity,
                        color: AppColor.white,
                        backgroundBtn: AppColor.black,
                        voidCallBack: () {
                          signUpProvider.submitData(context);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.google),
                          label: Text(
                            'Sign up with Google',
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.lightGrey),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              padding: const EdgeInsets.all(10),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                milliseconds: 1000,
              ),
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColor.pink,
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Login',
                          style: AppTextStyles.h3Pink,
                        ),
                      ),
                      InputDefault(
                        title: 'Phone Number',
                        suffixIcon: signInProvider.textPhone.isNotEmpty
                            ? IconButton(
                                onPressed: () =>
                                    signInProvider.clearPhoneController(),
                                icon: const Icon(Icons.clear_rounded),
                                color: AppColor.pink,
                              )
                            : null,
                        hintText: 'Eg: 0333xxx.xxx',
                        errorText: signInProvider.phone.error,
                        autofocus: false,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        controller: signInProvider.phoneController,
                        onChanged: (String value) {
                          signInProvider.checkPhone(value);
                        },
                        focusNode: signInProvider.phoneFocus,
                        onEditingComplete: () {
                          signInProvider.changeFocus(context, 'phone');
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InputDefault(
                        title: 'Password',
                        suffixIcon: signInProvider.textPassword.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () => signInProvider
                                        .clearPasswordController(),
                                    icon: const Icon(Icons.clear_rounded),
                                    color: AppColor.pink,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        signInProvider.changePasswordVariable(),
                                    icon: signInProvider.isPasswordVariable
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    color: AppColor.pink,
                                  ),
                                ],
                              )
                            : null,
                        hintText: '••••••••••',
                        errorText: signInProvider.password.error,
                        autofocus: false,
                        obscureText: signInProvider.isPasswordVariable,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: signInProvider.passwordController,
                        onChanged: (String value) {
                          signInProvider.checkPassword(value);
                        },
                        focusNode: signInProvider.passwordFocus,
                        onEditingComplete: () {
                          signInProvider.changeFocus(context, 'password');
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/forgetPassword',
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            style: AppTextStyles.h4Pink,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ButtonDefault(
                        content: 'Login',
                        height: 49,
                        width: double.infinity,
                        color: AppColor.white,
                        backgroundBtn: AppColor.black,
                        voidCallBack: () {
                          signInProvider.submitData(context);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 49,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(AssetPath.google),
                          label: Text(
                            'Login with Google',
                            style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.lightGrey),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

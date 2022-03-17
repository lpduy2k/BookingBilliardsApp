import 'dart:math';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/sign_up_req.dart';
import 'package:booking_billiards_app/repository/impl/auth_rep_impl.dart';
import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class SignUpProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirm = ValidationItem(null, null);

  //Getters
  ValidationItem get phone => _phone;
  ValidationItem get password => _password;
  ValidationItem get confirm => _confirm;

  final _phoneTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();
  final _confirmTextEditController = TextEditingController();

  TextEditingController get phoneController => _phoneTextEditController;
  TextEditingController get passwordController => _passwordTextEditController;
  TextEditingController get confirmController => _confirmTextEditController;

  String get textPhone => phoneController.text;
  String get textPassword => passwordController.text;
  String get textConfirm => confirmController.text;

  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  FocusNode get phoneFocus => _phoneFocus;
  FocusNode get passwordFocus => _passwordFocus;
  FocusNode get confirmFocus => _confirmFocus;

  bool isPasswordVariable = true;
  bool isConfirmVariable = true;
  bool submitValid = false;

  void clearPhoneController() {
    phoneController.clear();
    _phone = ValidationItem(null, null);
    notifyListeners();
  }

  void clearPasswordController() {
    passwordController.clear();
    _password = ValidationItem(null, null);
    notifyListeners();
  }

  void clearConfirmController() {
    confirmController.clear();
    _confirm = ValidationItem(null, null);
    notifyListeners();
  }

  void changePasswordVariable() {
    isPasswordVariable = !isPasswordVariable;
    notifyListeners();
  }

  void changeConfirmVariable() {
    isConfirmVariable = !isConfirmVariable;
    notifyListeners();
  }

  //Setters
  void checkPhone(String value) {
    if (value.length < 10) {
      _phone = ValidationItem(null, "Phone must 10 charactor");
    } else {
      _phone = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkPassword(String value) {
    if (value.length < 8) {
      _password = ValidationItem(null, "Password must 8 character");
    } else {
      _password = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkConfirm(String value) {
    if (value != password.value) {
      _confirm = ValidationItem(null, "Password doesn't match!");
    } else {
      _confirm = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _phoneFocus;
    if (_phone.value != null && field.contains("phone")) {
      newFocus = _passwordFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_password.value != null && field.contains("password")) {
      newFocus = _confirmFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_confirm.value != null && field.contains('confirm')) {
      FocusScope.of(context).unfocus();
      submitData(context);
    }
  }

  bool get isValid {
    if (_phone.value != null &&
        _password.value != null &&
        _confirm.value != null) {
      return true;
    }
    return false;
  }

  void submitData(BuildContext context) async {
    TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'ACcbd4489fd2ed4ddf5b0be69083e3c3b1',
      authToken: '05882e2a7f9479cdcbf244695c165fe5',
      twilioNumber: '+14025341898',
    );
    submitValid = _phone.error != null ||
        _password.error != null ||
        _confirm.error != null ||
        _phone.value == null ||
        _password.value == null ||
        _confirm.value == null;

    if (submitValid) {
      checkPhone(_phone.value ?? "");
      checkPassword(_password.value ?? "");
      checkConfirm(_confirm.value ?? "");
      notifyListeners();
    } else if (!submitValid && isValid) {
      String code = (Random().nextInt(8999) + 1000).toString();
      await secureStorage.writeSecureData("code", code);
      await twilioFlutter.sendSMS(
        toNumber: _phone.value.toString(),
        messageBody:
            'Please enter the following verification code to access your Account: ' +
                code,
      );
      Navigator.of(context).pushReplacementNamed('/inputPinCode');
      AuthRepImpl()
          .postSignUp(
              UrlApi.userPath,
              SignUpReq(
                username: _phone.value,
                fullName: null,
                phoneNumber: _phone.value,
                password: _password.value,
                image: null,
                roleId: '292CA636-D1C7-400E-8665-08D9DB6C000C',
              ))
          .then((response) => {
                showToastSuccess("Register successfully"),
                Navigator.of(context).pushReplacementNamed("/welcome")
              })
          .catchError((e) => print(e));
      clearPhoneController();
      clearPasswordController();
      clearConfirmController();
    }
  }
}

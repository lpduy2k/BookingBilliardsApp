import 'dart:developer';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/change_password_req.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:flutter/material.dart';

class ChangePassProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  ValidationItem _passwordOld = ValidationItem(null, null);
  ValidationItem _passwordNew = ValidationItem(null, null);
  ValidationItem _confirm = ValidationItem(null, null);

  ValidationItem get passwordOld => _passwordOld;
  ValidationItem get passwordNew => _passwordNew;
  ValidationItem get confirm => _confirm;

  final _passwordOldTextEditController = TextEditingController();
  final _passwordNewTextEditController = TextEditingController();
  final _confirmTextEditController = TextEditingController();

  TextEditingController get passwordOldController =>
      _passwordOldTextEditController;
  TextEditingController get passwordNewController =>
      _passwordNewTextEditController;
  TextEditingController get confirmController => _confirmTextEditController;

  String get textPasswordOld => passwordOldController.text;
  String get textPasswordNew => passwordNewController.text;
  String get textConfirm => confirmController.text;

  final _passwordOldFocus = FocusNode();
  final _passwordNewFocus = FocusNode();
  final _confirmFocus = FocusNode();

  FocusNode get passwordOldFocus => _passwordOldFocus;
  FocusNode get passwordNewFocus => _passwordNewFocus;
  FocusNode get confirmFocus => _confirmFocus;

  bool isPasswordOldVariable = true;
  bool isPasswordNewVariable = true;
  bool isConfirmVariable = true;
  bool submitValid = false;

  void clearPasswordOldController() {
    passwordOldController.clear();
    _passwordOld = ValidationItem(null, null);
    notifyListeners();
  }

  void clearPasswordNewController() {
    passwordNewController.clear();
    _passwordNew = ValidationItem(null, null);
    notifyListeners();
  }

  void clearConfirmController() {
    confirmController.clear();
    _confirm = ValidationItem(null, null);
    notifyListeners();
  }

  void changePasswordOldVariable() {
    isPasswordOldVariable = !isPasswordOldVariable;
    notifyListeners();
  }

  void changePasswordNewVariable() {
    isPasswordNewVariable = !isPasswordNewVariable;
    notifyListeners();
  }

  void changeConfirmVariable() {
    isConfirmVariable = !isConfirmVariable;
    notifyListeners();
  }

  void checkPasswordOld(String value) {
    if (value.length < 8) {
      _passwordOld = ValidationItem(null, "Password must 8 character");
    } else {
      _passwordOld = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkPasswordNew(String value) {
    if (value.length < 8) {
      _passwordNew = ValidationItem(null, "Password must 8 character");
    } else {
      _passwordNew = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkConfirm(String value) {
    if (value != passwordNew.value) {
      _confirm = ValidationItem(null, "Password doesn't match!");
    } else {
      _confirm = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _passwordOldFocus;
    if (_passwordOld.value != null && field.contains("passwordOld")) {
      newFocus = _passwordNewFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_passwordNew.value != null && field.contains("passwordNew")) {
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
    if (_passwordOld.value != null &&
        _passwordNew.value != null &&
        _confirm.value != null) {
      return true;
    }
    return false;
  }

  void submitData(BuildContext context) async {
    submitValid = _passwordOld.error != null ||
        _passwordNew.error != null ||
        _confirm.error != null ||
        _passwordOld.value == null ||
        _passwordNew.value == null ||
        _confirm.value == null;

    if (submitValid) {
      checkPasswordOld(_passwordOld.value ?? "");
      checkPasswordNew(_passwordNew.value ?? "");
      checkConfirm(_confirm.value ?? "");
      notifyListeners();
    } else {
      String userId = await secureStorage.readSecureData("userId");
      UserRepImpl()
          .putChangePass(
              UrlApi.userPath + "/updatepassword/$userId",
              ChangePasswordReq(
                  oldPassword: _passwordOld.value!,
                  newPassword: _passwordNew.value!))
          .then((value) async {
        value == "Change password success" ? showToastSuccess(value) : showToastFail(value);
      }).onError((error, stackTrace) {
        log(error.toString());
      });
    }
  }
}

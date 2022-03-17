import 'dart:developer';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:flutter/material.dart';

class ProfilePageProvider with ChangeNotifier {
  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _fullname = ValidationItem(null, null);

  //Getters
  ValidationItem get phone => _phone;
  ValidationItem get fullname => _fullname;

  final _phoneTextEditController = TextEditingController();
  final _fullnameTextEditController = TextEditingController();

  TextEditingController get phoneController => _phoneTextEditController;
  TextEditingController get fullnameController => _fullnameTextEditController;

  String get textPhone => phoneController.text;
  String get textFullname => fullnameController.text;

  final _phoneFocus = FocusNode();
  final _fullnameFocus = FocusNode();

  FocusNode get phoneFocus => _phoneFocus;
  FocusNode get fullnameFocus => _fullnameFocus;

  bool isPasswordVariable = true;
  bool submitValid = false;

  void clearPhoneController() {
    phoneController.clear();
    _phone = ValidationItem(null, null);
    notifyListeners();
  }

  void clearFullnameController() {
    fullnameController.clear();
    _fullname = ValidationItem(null, null);
    notifyListeners();
  }

  void changeFullnameVariable() {
    isPasswordVariable = !isPasswordVariable;
    notifyListeners();
  }

  //Setters
  void checkPhone(String value) {
    if (value.length < 10) {
      _phone = ValidationItem(null, "Phone must 10 character");
    } else {
      _phone = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkFullname(String value) {
    if (value.isEmpty) {
      _fullname = ValidationItem(null, "Fullname must have character");
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _phoneFocus;
    if (_phone.value != null && field.contains("phone")) {
      newFocus = _fullnameFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_fullname.value != null && field.contains('fullname')) {
      FocusScope.of(context).unfocus();
      submitData(context);
    }
  }

  bool get isValid {
    if (_phone.value != null && _fullname.value != null) {
      return true;
    }
    return false;
  }

  void submitData(BuildContext context) {
    submitValid = _phone.error != null ||
        _fullname.error != null ||
        _phone.value == null ||
        _fullname.value == null;

    if (submitValid) {
      checkPhone(_phone.value ?? "");
      checkFullname(_fullname.value ?? "");
      notifyListeners();
    } else if (!submitValid && isValid) {
      log('done');
    }
  }
}

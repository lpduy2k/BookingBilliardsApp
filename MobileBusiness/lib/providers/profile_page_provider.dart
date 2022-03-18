import 'dart:developer';
import 'dart:io';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/upload_user_req.dart';
import 'package:booking_billiards_app/repository/impl/image_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:flutter/material.dart';

class ProfilePageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  String? idUser;
  File? image;
  String? avatarSto;
  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _fullname = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);

  String? username;
  String? password;
  String? roleId;
  //Getters
  ValidationItem get phone => _phone;
  ValidationItem get fullname => _fullname;
  ValidationItem get email => _email;

  final _phoneTextEditController = TextEditingController();
  final _fullnameTextEditController = TextEditingController();
  final _emailTextEditController = TextEditingController();

  TextEditingController get phoneController => _phoneTextEditController;
  TextEditingController get fullnameController => _fullnameTextEditController;
  TextEditingController get emailController => _emailTextEditController;

  String get textPhone => phoneController.text;
  String get textFullname => fullnameController.text;
  String get textEmail => emailController.text;

  final _phoneFocus = FocusNode();
  final _fullnameFocus = FocusNode();
  final _emailFocus = FocusNode();

  FocusNode get phoneFocus => _phoneFocus;
  FocusNode get fullnameFocus => _fullnameFocus;
  FocusNode get emailFocus => _emailFocus;

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

  void clearEmailController() {
    emailController.clear();
    _email = ValidationItem(null, null);
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

  void checkEmail(String value) {
    if (value.isEmpty) {
      _email = ValidationItem(value, "email is empty");
    } else if (!RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')
        .hasMatch(value)) {
      _email = ValidationItem(value, "email invalid ");
    } else {
      _email = ValidationItem(value, null);
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
    if (_email.value != null && field.contains('email')) {
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

  void addDataUser(
      String idData,
      String imageData,
      String phoneData,
      String fullNameData,
      String emailData,
      String usernameData,
      String passwordData,
      String roleIdData) {
    idUser = idData;
    avatarSto = imageData;

    _phone.value = phoneData;
    _fullname.value = fullNameData;
    _email.value = emailData;
    _phoneTextEditController.text = phoneData;
    _fullnameTextEditController.text = fullNameData;
    _emailTextEditController.text = emailData;

    username = usernameData;
    password = passwordData;
    roleId = roleIdData;
  }

  void submitData(BuildContext context) async {
    submitValid = _phone.error != null ||
        _fullname.error != null ||
        _phone.value == null ||
        _fullname.value == null ||
        _email.error != null ||
        _email.value == null;

    if (submitValid) {
      checkPhone(_phone.value ?? "");
      checkFullname(_fullname.value ?? "");
      checkEmail(_email.value ?? "");
      notifyListeners();
    } else if (!submitValid && isValid) {
      if (image != null) {
        await ImageRepImpl()
            .uploadImage(UrlApi.imagePath, image!)
            .then((value) async {
          final urlImage = await secureStorage.readSecureData("urlImage");
          await UserRepImpl()
              .putUser(
            UrlApi.userPath + "/$idUser",
            UploadUserReq(
                id: idUser!,
                username: username!,
                fullName: textFullname,
                email: textEmail,
                phoneNumber: textPhone,
                password: password!,
                image: urlImage,
                roleId: roleId!),
          )
              .then((value) async {
            await secureStorage.deleteSecureData("urlImage");

            showToastSuccess(value);
          }).onError((error, stackTrace) {
            log(error.toString());
          });
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else if (avatarSto != null) {
        await UserRepImpl()
            .putUser(
          UrlApi.userPath + "/$idUser",
          UploadUserReq(
              id: idUser!,
              username: username!,
              fullName: textFullname,
              email: textEmail,
              phoneNumber: textPhone,
              password: password!,
              image: avatarSto!,
              roleId: roleId!),
        )
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else {
        String avatar = "null";
        await UserRepImpl()
            .putUser(
          UrlApi.userPath + "/$idUser",
          UploadUserReq(
              id: idUser!,
              username: username!,
              fullName: textFullname,
              email: textEmail,
              phoneNumber: textPhone,
              password: password!,
              image: avatar,
              roleId: roleId!),
        )
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      }
    }
  }
}

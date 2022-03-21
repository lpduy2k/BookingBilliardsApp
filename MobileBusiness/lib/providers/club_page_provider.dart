import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/upload_club_req.dart';
import 'package:booking_billiards_app/model/request/upload_table_req.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/image_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:flutter/material.dart';

class ClubPageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  String? idClub;
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _address = ValidationItem(null, null);
  ValidationItem _phone = ValidationItem(null, null);

  File? image;
  String? avatarClub;
  String? timeOpen;
  String? timeClose;
  int? quantity;
  String? status;
  String? Iduser;

  String selectedValue = "active";

  ValidationItem get name => _name;
  ValidationItem get address => _address;
  ValidationItem get phone => _phone;

  bool submitValid = false;

  final _nameTextEditController = TextEditingController();
  final _addressTextEditController = TextEditingController();
  final _phoneTextEditController = TextEditingController();

  TextEditingController get nameController => _nameTextEditController;
  TextEditingController get addressController => _addressTextEditController;
  TextEditingController get phoneController => _phoneTextEditController;

  String get textName => nameController.text;
  String get textAddress => addressController.text;
  String get textPhone => phoneController.text;

  final _nameFocus = FocusNode();
  final _addressFocus = FocusNode();
  final _phoneFocus = FocusNode();

  FocusNode get nameFocus => _nameFocus;
  FocusNode get addressFocus => _addressFocus;
  FocusNode get phoneFocus => _phoneFocus;

  bool get isValid {
    if (_name.value != null && _address.value != null && _phone.value != null) {
      return true;
    }
    return false;
  }

  void clearAddressController() {
    addressController.clear();
    _address = ValidationItem(null, null);
    notifyListeners();
  }

  void clearNameController() {
    nameController.clear();
    _name = ValidationItem(null, null);
    notifyListeners();
  }

  void clearPhoneController() {
    phoneController.clear();
    _phone = ValidationItem(null, null);
    notifyListeners();
  }

  void checkAddress(String value) {
    if (value.isEmpty) {
      _address = ValidationItem(null, "Address can not empty");
    } else {
      _address = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkName(String value) {
    if (value.isEmpty) {
      _name = ValidationItem(null, "Name can not empty");
    } else {
      _name = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void checkPhone(String value) {
    if (value.isEmpty) {
      _phone = ValidationItem(null, "Phone can not empty");
    } else {
      _phone = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _addressFocus;
    if (_address.value != null && field.contains("Address")) {
      newFocus = _addressFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_name.value != null && field.contains("Name")) {
      newFocus = _nameFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_phone.value != null && field.contains("Phone")) {
      newFocus = _phoneFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
  }

  void addDataTable(
      String idClubData,
      String nameData,
      String addressData,
      String phoneData,
      String imageData,
      String timeOpenData,
      String timeCloseData,
      int quantityData,
      String statusData,
      String UseridData) {
    idClub = idClubData;
    avatarClub = imageData;

    _name.value = nameData;
    _address.value = addressData;
    _phone.value = phoneData;
    _nameTextEditController.text = nameData;
    _addressTextEditController.text = addressData;
    _phoneTextEditController.text = phoneData;

    timeOpen = timeOpenData;
    timeClose = timeCloseData;
    quantity = quantityData;
    status = statusData;
    selectedValue = statusData;
    Iduser = UseridData;
  }

  void submitData(BuildContext context) async {
    submitValid = _name.error != null ||
        _address.error != null ||
        _phone.error != null ||
        _name.value == null ||
        _address.value == null ||
        _phone.value == null;

    if (!submitValid && isValid) {
      if (image != null) {
        await ImageRepImpl()
            .uploadImage(UrlApi.imagePath, image!)
            .then((value) async {
          final urlImage = await secureStorage.readSecureData("urlImage");
          await BidaClubRepImpl()
              .putClub(
                  UrlApi.bidaClubPath + "/$idClub",
                  UploadClubReq(
                      id: idClub!,
                      name: textName,
                      address: textAddress,
                      phoneNumber: textPhone,
                      image: urlImage!,
                      timeOpen: timeOpen!,
                      timeClose: timeClose!,
                      quantity: quantity!,
                      status: status!,
                      userId: Iduser!))
              .then((value) async {
            await secureStorage.deleteSecureData("urlImage");
            showToastSuccess(value);
          }).onError((error, stackTrace) {
            log(error.toString());
          });
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else if (avatarClub != null) {
        await BidaClubRepImpl()
            .putClub(
                UrlApi.bidaClubPath + "/$idClub",
                UploadClubReq(
                    id: idClub!,
                    name: textName,
                    address: textAddress,
                    phoneNumber: textPhone,
                    image: avatarClub!,
                    timeOpen: timeOpen!,
                    timeClose: timeClose!,
                    quantity: quantity!,
                    status: status!,
                    userId: Iduser!))
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else {
        String avatar = "null";

        await BidaClubRepImpl()
            .putClub(
                UrlApi.bidaClubPath + "/$idClub",
                UploadClubReq(
                    id: idClub!,
                    name: textName,
                    address: textAddress,
                    phoneNumber: textPhone,
                    image: avatar,
                    timeOpen: timeOpen!,
                    timeClose: timeClose!,
                    quantity: quantity!,
                    status: status!,
                    userId: Iduser!))
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      }
    }
  }
}

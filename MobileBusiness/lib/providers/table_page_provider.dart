import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/upload_table_req.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/image_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:flutter/material.dart';

class TablePageProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  String? idTable;
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _price = ValidationItem(null, null);
  String? type;
  File? image;
  String? avatarTable;
  String? status;
  String? idClub;
  String selectedValue = "active";

  ValidationItem get name => _name;
  ValidationItem get price => _price;
  bool submitValid = false;

  final _nameTextEditController = TextEditingController();
  final _priceTextEditController = TextEditingController();

  TextEditingController get nameController => _nameTextEditController;
  TextEditingController get priceController => _priceTextEditController;

  String get textName => nameController.text;
  String get textPrice => priceController.text;

  final _priceFocus = FocusNode();
  final _nameFocus = FocusNode();

  FocusNode get priceFocus => _priceFocus;
  FocusNode get nameFocus => _nameFocus;

  bool get isValid {
    if (_name.value != null && _price.value != null) {
      return true;
    }
    return false;
  }

  void clearPriceController() {
    priceController.clear();
    _price = ValidationItem(null, null);
    notifyListeners();
  }

  void clearNameController() {
    nameController.clear();
    _name = ValidationItem(null, null);
    notifyListeners();
  }

  void checkPrice(String value) {
    if (value.isEmpty) {
      _price = ValidationItem(null, "Price can not empty");
    }
    notifyListeners();
  }

  void checkName(String value) {
    if (value.isEmpty) {
      _price = ValidationItem(null, "Name can not empty");
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _priceFocus;
    if (_price.value != null && field.contains("Price")) {
      newFocus = _priceFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_name.value != null && field.contains("name")) {
      newFocus = _nameFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
  }

  void addDataTable(String idTableData, String imageData, String nameData,
      int priceData, String typeData, String statusData, String idClubData) {
    idTable = idTableData;
    avatarTable = imageData;

    _name.value = nameData;
    _price.value = priceData.toString();
    _nameTextEditController.text = nameData;
    _priceTextEditController.text = priceData.toString();

    type = typeData;
    status = statusData;
    selectedValue = statusData;
    idClub = idClubData;
  }

  void submitData(BuildContext context) async {
    submitValid =
        _name.error != null || price.toString().isEmpty || _name.value == null;

    if (!submitValid && isValid) {
      print(selectedValue);
      if (image != null) {
        await ImageRepImpl()
            .uploadImage(UrlApi.imagePath, image!)
            .then((value) async {
          final urlImage = await secureStorage.readSecureData("urlImage");
          await BidaTableRepImpl()
              .putTable(
                  UrlApi.bidaTablePath + "/$idTable",
                  UploadTableReq(
                      id: idTable!,
                      name: textName,
                      type: type!,
                      image: urlImage,
                      price: double.parse(textPrice),
                      status: selectedValue,
                      bidaClubId: idClub!))
              .then((value) async {
            await secureStorage.deleteSecureData("urlImage");
            showToastSuccess(value);
          }).onError((error, stackTrace) {
            log(error.toString());
          });
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else if (avatarTable != null) {
        await BidaTableRepImpl()
            .putTable(
                UrlApi.bidaTablePath + "/$idTable",
                UploadTableReq(
                    id: idTable!,
                    name: textName,
                    type: type!,
                    image: avatarTable!,
                    price: double.parse(textPrice),
                    status: selectedValue,
                    bidaClubId: idClub!))
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else {
        String avatar = "null";
        await BidaTableRepImpl()
            .putTable(
                UrlApi.bidaTablePath + "/$idTable",
                UploadTableReq(
                    id: idTable!,
                    name: textName,
                    type: type!,
                    image: avatar,
                    price: double.parse(textPrice),
                    status: selectedValue,
                    bidaClubId: idClub!))
            .then((value) async {
          showToastSuccess(value);
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      }
    }
  }
}

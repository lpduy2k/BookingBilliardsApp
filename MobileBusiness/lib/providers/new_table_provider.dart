import 'dart:developer';

import 'dart:io';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/create_table_req.dart';

import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/image_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/view/homePage/home.dart';
import 'package:flutter/material.dart';

class CreateTableProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  // String? idclub;
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _price = ValidationItem(null, null);
  String? type;
  File? image;

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
    } else {
      _price = ValidationItem(value, null);
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

  void changeFocus(BuildContext context, String field) {
    var newFocus = _priceFocus;
    if (_price.value != null && field.contains("Price")) {
      newFocus = _priceFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_name.value != null && field.contains("Name")) {
      newFocus = _nameFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
  }

  bool get isValid {
    if (_name.value != null && _price.value != null) {
      return true;
    }
    return false;
  }

  void addData(BuildContext context) async {
    submitValid =
        _name.error != null || price.toString().isEmpty || _name.value == null;

    if (!submitValid && isValid) {
      if (image != null) {
        print("object");
        await ImageRepImpl()
            .uploadImage(UrlApi.imagePath, image!)
            .then((value) async {
          final urlImage = await secureStorage.readSecureData("urlImage");

          await BidaTableRepImpl()
              .createTable(
                  UrlApi.bidaTablePath,
                  CreateTableReq(
                      name: textName,
                      type: '1',
                      image: urlImage,
                      price: double.parse(textPrice),
                      status: selectedValue,
                      bidaClubId: idClub!))
              .then((value) async {
            await secureStorage.deleteSecureData("urlImage");
            showToastSuccess(value);

            final userId = await secureStorage.readSecureData("userId");
            BidaClubRepImpl()
                .getBidaClub(UrlApi.bidaClubPath + "?userId=$userId")
                .then((value) async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home(bidaClub: value);
              }));
            });
          }).onError((error, stackTrace) {
            log(error.toString());
          });
        }).onError((error, stackTrace) {
          log(error.toString());
        });
      } else {
        showToastFail("fail ");
      }
    }
  }
}

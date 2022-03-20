import 'dart:io';

import 'package:booking_billiards_app/configs/base/base_validation.dart';
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

  ValidationItem get name => _name;
  ValidationItem get price => _price;
  bool submitValid = false;

  bool get isValid {
    if (_name.value != null && _price.value != null) {
      return true;
    }
    return false;
  }

  void addDataUser(
    String idData,
    String imageData,
    String nameData,
    String priceData,
    String typeData,
    String statusData,
  ) {
    idTable = idData;
    avatarTable = imageData;

    _name.value = nameData;
    _price.value = priceData;

    type = typeData;
    status = statusData;
  }

  void submitData(BuildContext context) async {
    submitValid = _name.error != null ||
        _price.error != null ||
        _name.value == null ||
        _price.value == null;

    if (!submitValid && isValid) {
      if (image != null) {
        await ImageRepImpl()
            .uploadImage(UrlApi.imagePath, image!)
            .then((value) async {
          final urlImage = await secureStorage.readSecureData("urlImage");
          await BidaTableRepImpl()
              .getBidaTableDetail(
            UrlApi.bidaTablePath + "/$idTable",
            UploadTableReq(
              id: idTable!,
              name: name!,
              type: type,
              image: price!,
              price: urlImage,
              status: roleId!,
            ),
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

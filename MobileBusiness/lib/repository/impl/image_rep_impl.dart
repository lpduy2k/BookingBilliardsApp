import 'dart:convert';
import 'dart:io';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/response/upload_image_res.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:dio/dio.dart';

import '../image_rep.dart';

class ImageRepImpl implements ImageRepo {
  @override
  Future<UploadImageRes> uploadImage(String url, File image) async {
    var result = UploadImageRes();
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, filename: fileName)
      });
      Response response = await Dio().post(url, data: formData);
      result = UploadImageRes.uploadImageResFromJson(jsonEncode(response.data));
      final SecureStorage secureStorage = SecureStorage();
      await secureStorage.writeSecureData("urlImage", result.urlImage!);
    } on DioError catch (e) {
      showToastFail(e.response?.data["message"]);
    }
    return result;
  }
}

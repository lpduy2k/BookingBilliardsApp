import 'dart:io';

import 'package:booking_billiards_app/model/response/upload_image_res.dart';

abstract class ImageRepo {
  Future<UploadImageRes> uploadImage(String url, File image);
}

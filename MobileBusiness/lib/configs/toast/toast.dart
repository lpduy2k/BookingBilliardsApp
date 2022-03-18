import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastSuccess(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: AppColor.greenToast,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 3);
void showToastFail(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: AppColor.redToast,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 3);

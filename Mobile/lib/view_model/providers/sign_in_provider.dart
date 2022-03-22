import 'package:booking_billiards_app/configs/base/base_validation.dart';
import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/impl/auth_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/booking_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/view/bottomNavBar/bottomNavBar.dart';
import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:booking_billiards_app/widgets/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decode/jwt_decode.dart';

class SignInProvider with ChangeNotifier {
  GetUserRes? user;
  List<GetListHistoryRes>? listHistory;
  final SecureStorage secureStorage = SecureStorage();
  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  //Getters
  ValidationItem get phone => _phone;
  ValidationItem get password => _password;

  final _phoneTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  TextEditingController get phoneController => _phoneTextEditController;
  TextEditingController get passwordController => _passwordTextEditController;

  String get textPhone => phoneController.text;
  String get textPassword => passwordController.text;

  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  FocusNode get phoneFocus => _phoneFocus;
  FocusNode get passwordFocus => _passwordFocus;

  bool isPasswordVariable = true;
  bool submitValid = false;

  void clearPhoneController() {
    phoneController.clear();
    _phone = ValidationItem(null, null);
    notifyListeners();
  }

  void clearPasswordController() {
    passwordController.clear();
    _password = ValidationItem(null, null);
    notifyListeners();
  }

  void changePasswordVariable() {
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

  void checkPassword(String value) {
    if (value.length < 8) {
      _password = ValidationItem(null, "Password must 8 character");
    } else {
      _password = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _phoneFocus;
    if (_phone.value != null && field.contains("phone")) {
      newFocus = _passwordFocus;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_password.value != null && field.contains('password')) {
      FocusScope.of(context).unfocus();
      submitData(context);
    }
  }

  bool get isValid {
    if (_phone.value != null && _password.value != null) {
      return true;
    }
    return false;
  }

  void submitData(BuildContext context) {
    Map<String, dynamic> payload;
    submitValid = _phone.error != null ||
        _password.error != null ||
        _phone.value == null ||
        _password.value == null;

    if (submitValid) {
      checkPhone(_phone.value ?? "");
      checkPassword(_password.value ?? "");
      notifyListeners();
    } else if (!submitValid && isValid) {
      Loading(context);

      AuthRepImpl()
          .postSignIn(
            UrlApi.userPath,
            SignInReq(
              username: _phone.value.toString(),
              password: _password.value.toString(),
            ),
          )
          .then(
            (value) async => {
              if (value.token != null)
                {
                  await secureStorage.writeSecureData(
                    "token",
                    value.token.toString(),
                  ),
                  payload = Jwt.parseJwt(value.token.toString()),
                  if (payload['Role'].toString() == "USER")
                    {
                  await secureStorage.writeSecureData(
                    "userId",
                    payload['Id'].toString(),
                  ),
                  await secureStorage.writeSecureData(
                    "userName",
                    payload['UserName'].toString(),
                  ),
                  BidaClubRepImpl().getBidaClub(UrlApi.bidaClubPath).then(
                    (value) async {
                      await UserRepImpl()
                          .getUser(UrlApi.userPath +
                              "/${payload['UserName'].toString()}")
                          .then((value) async {
                        user = value;
                      });
                      await BookingRepImpl().getListHistoryBooking(UrlApi.bookingPath + "?userId=${payload['Id'].toString()}").then((value) async {
                        listHistory = value;
                      });
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BottomNavBar(
                                currentIndex: 0,
                                listBidaClub: value,
                                user: user,
                                listHistory: listHistory!);
                          },
                        ),
                      );
                    },
                  ),
                  clearPhoneController(),
                  clearPasswordController(),
                  showToastSuccess("Login successfully"),
                }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: "No permission",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0)
                    }
                }
              else
                {
                  Navigator.pop(context),
                  notifyListeners(),
                }
            },
          );
    }
  }
}

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/impl/auth_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/view/homePage/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ValidationItem {
  GetBidaClubRes? bidaClub;

  final String? value;
  final String? error;
  ValidationItem(this.value, this.error);
}

class SignInProvider with ChangeNotifier {
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

  void submitData(BuildContext context) async {
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
                  if (payload['Role'].toString() == "ADMIN")
                    {
                      await secureStorage.writeSecureData(
                        "userId",
                        payload['Id'].toString(),
                      ),
                      await secureStorage.writeSecureData(
                        "userName",
                        payload['UserName'].toString(),
                      ),
                      BidaClubRepImpl()
                          .getBidaClub(UrlApi.bidaClubPath +
                              "?userId=${payload['Id'].toString()}")
                          .then(
                        (value) async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home(
                                  bidaClub: value,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      clearPhoneController(),
                      clearPasswordController(),
                      // Navigator.of(context).pushReplacementNamed('/home'),
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
                          fontSize: 16.0),
                      Navigator.pop(context),
                      notifyListeners(),
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

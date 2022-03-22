import 'dart:io';

import 'package:booking_billiards_app/configs/toast/toast.dart';
import 'package:booking_billiards_app/model/request/sign_in_req.dart';
import 'package:booking_billiards_app/model/request/sign_up_req.dart';
import 'package:booking_billiards_app/model/response/get_list_history_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/repository/impl/auth_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/booking_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/view/bottomNavBar/bottomNavBar.dart';
import 'package:booking_billiards_app/view/welcome/welcome.dart';
import 'package:booking_billiards_app/view_model/service/service_storage.dart';
import 'package:booking_billiards_app/view_model/url_api/url_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decode/jwt_decode.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final SecureStorage secureStorage = SecureStorage();
  late Map<String, dynamic> payload;
  GetUserRes? user;
  List<GetListHistoryRes>? listHistory;
  @override
  Widget build(BuildContext context) => Material(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              // final currentUser = FirebaseAuth.instance.currentUser;
              AuthRepImpl()
                  .postSignIn(
                    UrlApi.userPath,
                    SignInReq(
                      username: "0335339333",
                      password: "12345678",
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
                              BidaClubRepImpl()
                                  .getBidaClub(UrlApi.bidaClubPath)
                                  .then(
                                (value) async {
                                  await UserRepImpl()
                                      .getUser(UrlApi.userPath +
                                          "/${payload['UserName'].toString()}")
                                      .then((value) async {
                                    user = value;
                                  });
                                  await BookingRepImpl()
                                      .getListHistoryBooking(UrlApi
                                              .bookingPath +
                                          "?userId=${payload['Id'].toString()}")
                                      .then((value) async {
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
                            }
                        }
                    },
                  );
            } else {
              return const WelcomePage();
            }
            return const WelcomePage();
          },
        ),
      );
}

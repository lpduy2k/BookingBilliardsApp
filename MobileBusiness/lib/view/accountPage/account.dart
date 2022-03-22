import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/view/accountPage/profilePage.dart';
import 'package:booking_billiards_app/view/homePage/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/themes/app_color.dart';
import '../../utils/window_size.dart';
import '../../widgets/button/button.dart';

class AccountPage extends StatelessWidget {
  final GetUserRes user;

  AccountPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(1),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.lightGreen,
        body: SingleChildScrollView(
          child: Body(
            user: user,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final GetUserRes user;

  Body({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProfilePageProvider profilePageProvider =
        Provider.of<ProfilePageProvider>(context);
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: windowHeight * windowSizeHeight(1),
              bottom: windowHeight * windowSizeHeight(35),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BidaClubRepImpl()
                    .getBidaClub(UrlApi.bidaClubPath + "?userId=${user.id}")
                    .then((value) async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home(
                      bidaClub: value,
                    );
                  }));
                });
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                profilePageProvider.addDataUser(
                    user.id!,
                    user.image!,
                    user.phoneNumber!,
                    user.fullName!,
                    user.email!,
                    user.username!,
                    user.password!,
                    user.roleId!);
                Navigator.of(context).pushNamed(
                  '/profilePage',
                );
              },
            ),
            iconColor: AppColor.black,
          ),
          const Text(
            'Your Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          ClipOval(
            child: user.image! == "null"
                ? Image.asset(
                    AssetPath.defaultAvatar,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    user.image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          Text(
            'Full Name: ' + user.fullName!,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          Text(
            "User Name : " + user.username!,
            style: const TextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          Text(
            "Phone Number : " + user.phoneNumber!,
            style: const TextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
          Text(
            "Email : " + user.email!,
            style: const TextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          const Divider(
            height: 40,
            thickness: 2,
            indent: 100,
            endIndent: 100,
            color: Colors.blueGrey,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          ButtonDefault(
            width: 100,
            height: 29,
            content: 'Logout',
            color: AppColor.white,
            backgroundBtn: AppColor.red,
            voidCallBack: () {
              final SecureStorage secureStorage = SecureStorage();
              secureStorage.deleteAll();
              Navigator.of(context).pushNamed(
                '/welcome',
              );
            },
          ),
        ],
      ),
    );
  }
}

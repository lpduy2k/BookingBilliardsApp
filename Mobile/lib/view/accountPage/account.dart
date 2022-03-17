import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/themes/app_color.dart';
import '../../model/response/get_user_res.dart';
import '../../utils/window_size.dart';
import '../../view_model/providers/profile_page_provider.dart';
import '../../widgets/button/button.dart';

class AccountPage extends StatelessWidget {
  final GetUserRes user;
  const AccountPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(1),
      ),
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.lightGrey,
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
  const Body({Key? key, required this.user}) : super(key: key);
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
              top: windowHeight * windowSizeHeight(30),
              bottom: windowHeight * windowSizeHeight(35),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 20,
              child: ClipOval(
                child: user.image! == "null"
                    ? Image.asset(AssetPath.defaultAvatar)
                    : Image.network(
                        user.image!,
                      ),
              ),
            ),
            title: Text(
              user.fullName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 3),
                ),
                Text(
                  user.phoneNumber!,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            trailing: const Icon(Icons.notifications_outlined),
            selectedColor: AppColor.white,
            tileColor: AppColor.white,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const Divider(
            height: 40,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: const Icon(Icons.account_box_outlined),
            title: const Text(
              'Account setting',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                profilePageProvider.addDataUser(
                  user.id!, 
                  user.image!, 
                  user.phoneNumber!, 
                  user.fullName!,
                  user.username!,
                  user.password!,
                  user.roleId!);
                Navigator.of(context).pushNamed(
                  '/profilePage',
                );
              },
            ),
            tileColor: AppColor.white,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColor.black,
          ),
          const Divider(
            height: 50,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text(
              'Language',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(Icons.navigate_next),
            tileColor: AppColor.white,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColor.black,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: const Icon(Icons.textsms_outlined),
            title: const Text(
              'Booking History',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(Icons.navigate_next),
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColor.black,
            tileColor: AppColor.white,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          ButtonDefault(
            width: 100,
            height: 29,
            content: 'Logout',
            color: AppColor.white,
            backgroundBtn: AppColor.red,
            voidCallBack: () {
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

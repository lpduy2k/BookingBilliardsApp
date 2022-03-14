import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/view/accountPage/profilePage.dart';
import 'package:flutter/material.dart';

import '../../configs/themes/app_color.dart';
import '../../utils/window_size.dart';
import '../../widgets/button/button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
        body: const SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      // padding: EdgeInsets.only(
      //   top: windowHeight * windowSizeHeight(70),
      //   bottom: windowHeight * windowSizeHeight(35),
      // ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: windowHeight * windowSizeHeight(1),
              bottom: windowHeight * windowSizeHeight(35),
            ),
          ),

          ListTile(
            // leading: Icon(Icons.arrow_back),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            // tileColor: AppColor.white,
            iconColor: AppColor.black,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCR-s1OFav5Qn1MIUjAp3VE1FFIgohqJuauA&usqp=CAU',
                ),
              ),
            ),
            title: const Text(
              'UserName',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 3),
                ),
                Text(
                  'boychungtinh_chiyeuminhem@gmail.com',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            trailing: const Icon(Icons.notifications_outlined),
            selectedColor: AppColor.white,
            tileColor: AppColor.green,
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
          // Padding(
          //   padding: EdgeInsets.only(top: 30),
          // ),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: const Text(
              'Account setting',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            tileColor: AppColor.green,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColor.black,
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 30),
          // ),
          const Divider(
            height: 50,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: const Text(
              'Language',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: const Icon(Icons.navigate_next),
            tileColor: AppColor.green,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            iconColor: AppColor.black,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: Icon(Icons.textsms_outlined),
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
            tileColor: AppColor.green,
          ),
          Padding(
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

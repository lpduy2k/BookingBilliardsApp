import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/utils/window_size.dart';

import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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

    ProfilePageProvider profilePageProvider =
        Provider.of<ProfilePageProvider>(context);

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
              top: windowHeight * windowSizeHeight(5),
              bottom: windowHeight * windowSizeHeight(15),
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
          Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 75,
                child: ClipOval(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCR-s1OFav5Qn1MIUjAp3VE1FFIgohqJuauA&usqp=CAU',
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet(context)));
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 10),
          // ),
          // const Padding(
          //     padding: EdgeInsets.only(top: 12.0),
          //     child: Text(
          //       "Full Name",
          //       style: TextStyle(color: Colors.grey),
          //     )),
          // const TextField(
          //   decoration: InputDecoration(
          //     hintText: "Update FullName",
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 10),
          // ),
          // const Padding(
          //     padding: EdgeInsets.only(top: 12.0),
          //     child: Text(
          //       "Phone Number",
          //       style: TextStyle(color: Colors.grey),
          //     )),
          // const TextField(
          //   decoration: InputDecoration(
          //     hintText: "Update phone Number",
          //   ),
          // ),

          Column(
            children: <Widget>[
              InputDefault(
                title: 'Phone Number',
                suffixIcon: profilePageProvider.textPhone.isNotEmpty
                    ? IconButton(
                        onPressed: () =>
                            profilePageProvider.clearPhoneController(),
                        icon: const Icon(Icons.clear_rounded),
                        color: AppColor.pink,
                      )
                    : null,
                hintText: 'Eg: 0333xxx.xxx',
                errorText: profilePageProvider.phone.error,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: profilePageProvider.phoneController,
                onChanged: (String value) {
                  profilePageProvider.checkPhone(value);
                },
                focusNode: profilePageProvider.phoneFocus,
                onEditingComplete: () {
                  profilePageProvider.changeFocus(context, 'phone');
                },
              ),
              const SizedBox(
                height: 5,
              ),
              InputDefault(
                title: 'Full Name',
                suffixIcon: profilePageProvider.textFullname.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () =>
                                profilePageProvider.clearFullnameController(),
                            icon: const Icon(Icons.clear_rounded),
                            color: AppColor.pink,
                          ),
                          IconButton(
                            onPressed: () =>
                                profilePageProvider.changeFullnameVariable(),
                            icon: profilePageProvider.isPasswordVariable
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColor.pink,
                          ),
                        ],
                      )
                    : null,
                hintText: 'Update FullName',
                errorText: profilePageProvider.fullname.error,
                autofocus: false,
                obscureText: profilePageProvider.isPasswordVariable,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: profilePageProvider.fullnameController,
                onChanged: (String value) {
                  profilePageProvider.checkFullname(value);
                },
                focusNode: profilePageProvider.fullnameFocus,
                onEditingComplete: () {
                  profilePageProvider.changeFocus(context, 'fullname');
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          ButtonDefault(
            width: 200,
            height: 25,
            content: 'Change Password',
            color: AppColor.white,
            backgroundBtn: AppColor.black,
            voidCallBack: () {
              Navigator.of(context).pushNamed(
                '/changeNewPassword',
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          ButtonDefault(
            width: 100,
            height: 25,
            content: 'Update',
            color: AppColor.white,
            backgroundBtn: AppColor.red,
            voidCallBack: () {
              profilePageProvider.submitData(context);
            },
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(context) {
    return Container(
      //height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "Choose photo",
            style: TextStyle(fontSize: 20.0),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              // pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () {
              // pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Remove'),
            // onTap: removeImage,
          ),
        ],
      ),
    );
  }
}

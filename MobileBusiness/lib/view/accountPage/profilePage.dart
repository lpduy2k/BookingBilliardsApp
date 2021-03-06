import 'dart:developer';
import 'dart:io';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/model/response/get_user_res.dart';
import 'package:booking_billiards_app/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/user_rep_impl.dart';
import 'package:booking_billiards_app/service/service_storage.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/view/accountPage/account.dart';

import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:booking_billiards_app/widgets/upload_image/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GetUserRes? user;
  @override
  Widget build(BuildContext context) {
    ProfilePageProvider profilePageProvider =
        Provider.of<ProfilePageProvider>(context);

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() {
          profilePageProvider.image = imageTemporary;
        });
      } catch (e) {
        log("Failed to pick image: $e");
      }
    }

    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: windowHeight * windowSizeHeight(5),
              bottom: windowHeight * windowSizeHeight(15),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                final SecureStorage secureStorage = SecureStorage();
                final username = await secureStorage.readSecureData("userName");
                UserRepImpl().getUser(UrlApi.userPath + "/$username").then(
                  (value) async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AccountPage(
                        user: value,
                      );
                    }));
                  },
                );
              },
            ),
            iconColor: AppColor.black,
          ),
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          UploadImage(
              widget: ClipRRect(
                  borderRadius: BorderRadius.circular(100 / 2),
                  child: profilePageProvider.image != null
                      ? Image.file(
                          profilePageProvider.image!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                      : (profilePageProvider.avatarSto != "null"
                          ? Image.network(
                              profilePageProvider.avatarSto!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )
                          : const Image(
                              image: AssetImage(AssetPath.defaultAvatar),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ))),
              pickImage: pickImage,
              removeImage: () {
                setState(() {
                  profilePageProvider.image = null;
                  profilePageProvider.avatarSto = "null";
                });
              }),
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
                    ? IconButton(
                        onPressed: () =>
                            profilePageProvider.clearFullnameController(),
                        icon: const Icon(Icons.clear_rounded),
                        color: AppColor.pink,
                      )
                    : null,
                hintText: 'Update FullName',
                errorText: profilePageProvider.fullname.error,
                autofocus: false,
                obscureText: false,
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
                height: 5,
              ),
              InputDefault(
                title: 'Email',
                suffixIcon: profilePageProvider.textEmail.isNotEmpty
                    ? IconButton(
                        onPressed: () =>
                            profilePageProvider.clearEmailController(),
                        icon: const Icon(Icons.clear_rounded),
                        color: AppColor.pink,
                      )
                    : null,
                hintText: 'Update Email',
                errorText: profilePageProvider.email.error,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: profilePageProvider.emailController,
                onChanged: (String value) {
                  profilePageProvider.checkEmail(value);
                },
                focusNode: profilePageProvider.emailFocus,
                onEditingComplete: () {
                  profilePageProvider.changeFocus(context, 'email');
                },
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
            backgroundBtn: AppColor.redToast,
            voidCallBack: () {
              profilePageProvider.submitData(context);
            },
          ),
        ],
      ),
    );
  }
}

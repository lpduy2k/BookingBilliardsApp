import 'dart:developer';
import 'dart:io';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/providers/club_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/view/clubProfile/club_profile.dart';

import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:booking_billiards_app/widgets/upload_image/upload_image.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditClubProfile extends StatefulWidget {
  const EditClubProfile({Key? key}) : super(key: key);

  @override
  State<EditClubProfile> createState() => _EditClubProfileState();
}

class _EditClubProfileState extends State<EditClubProfile> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Open"), value: "active"),
      const DropdownMenuItem(child: Text("Close"), value: "inactive"),
    ];

    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    ClubPageProvider clubPageProvider = Provider.of<ClubPageProvider>(context);
    TimeOfDay time1 = TimeOfDay(
        hour: int.parse(clubPageProvider.timeOpen!.split(":")[0]),
        minute: int.parse(clubPageProvider.timeOpen!.split(":")[1]));

    TimeOfDay time2 = TimeOfDay(
        hour: int.parse(clubPageProvider.timeClose!.split(":")[0]),
        minute: int.parse(clubPageProvider.timeClose!.split(":")[1]));

    String formatTimeOfDay(TimeOfDay tod) {
      final now = new DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
      final format = DateFormat.Hm(); //"6:00 AM"
      return format.format(dt);
    }

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() {
          clubPageProvider.image = imageTemporary;
        });
      } catch (e) {
        log("Failed to pick image: $e");
      }
    }

    Size size = MediaQuery.of(context).size;
    double sizeHeightInput = size.height * 0.12;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin:
            EdgeInsets.fromLTRB(0, size.height * 0.05, 0, size.height * 0.05),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: () {
                  BidaClubRepImpl()
                      .getBidaClub(
                          UrlApi.bidaClubPath + "/${clubPageProvider.idClub!}")
                      .then((value) async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ClubProfile(
                        bidaClub: value,
                      );
                    }));
                  });
                },
              )),
            ]),
            UploadImage(
                widget: ClipRRect(
                    borderRadius: BorderRadius.circular(100 / 2),
                    child: clubPageProvider.image != null
                        ? Image.file(
                            clubPageProvider.image!,
                            fit: BoxFit.cover,
                            width: 400,
                            height: 200,
                          )
                        : (clubPageProvider.avatarClub != "null"
                            ? Image.network(
                                clubPageProvider.avatarClub!,
                                fit: BoxFit.cover,
                                width: 400,
                                height: 200,
                              )
                            : const Image(
                                image: AssetImage(AssetPath.defaultPicture),
                                fit: BoxFit.cover,
                                width: 400,
                                height: 200,
                              ))),
                pickImage: pickImage,
                removeImage: () {
                  setState(() {
                    clubPageProvider.image = null;
                    clubPageProvider.avatarClub = "null";
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: <Widget>[
                InputDefault(
                  title: 'Club Name',
                  suffixIcon: clubPageProvider.textName.isNotEmpty
                      ? IconButton(
                          onPressed: () =>
                              clubPageProvider.clearNameController(),
                          icon: const Icon(Icons.clear_rounded),
                          color: AppColor.pink,
                        )
                      : null,
                  hintText: 'Update Name',
                  errorText: clubPageProvider.name.error,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: clubPageProvider.nameController,
                  onChanged: (String value) {
                    clubPageProvider.checkName(value);
                  },
                  focusNode: clubPageProvider.nameFocus,
                  onEditingComplete: () {
                    clubPageProvider.changeFocus(context, 'Name');
                  },
                ),
                InputDefault(
                  title: 'Address Club',
                  suffixIcon: clubPageProvider.textAddress.isNotEmpty
                      ? IconButton(
                          onPressed: () =>
                              clubPageProvider.clearAddressController(),
                          icon: const Icon(Icons.clear_rounded),
                          color: AppColor.pink,
                        )
                      : null,
                  hintText: 'Update Address',
                  errorText: clubPageProvider.address.error,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: clubPageProvider.addressController,
                  onChanged: (String value) {
                    clubPageProvider.checkAddress(value);
                  },
                  focusNode: clubPageProvider.addressFocus,
                  onEditingComplete: () {
                    clubPageProvider.changeFocus(context, 'Address');
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Open time:',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        '${time1.hour.toString().padLeft(2, '0')}:${time1.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.timer_sharp,
                        color: Colors.black87,
                      ),
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: context, initialTime: time1);
                        if (newTime != null) {
                          setState(() {
                            clubPageProvider.timeOpen =
                                formatTimeOfDay(newTime);
                          });
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Close time:',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        '${time2.hour.toString().padLeft(2, '0')}:${time2.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.timer_sharp,
                        color: Colors.black87,
                      ),
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: context, initialTime: time2);
                        if (newTime != null) {
                          setState(() {
                            clubPageProvider.timeClose =
                                formatTimeOfDay(newTime);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            InputDefault(
              title: 'Phone Number',
              suffixIcon: clubPageProvider.textPhone.isNotEmpty
                  ? IconButton(
                      onPressed: () => clubPageProvider.clearPhoneController(),
                      icon: const Icon(Icons.clear_rounded),
                      color: AppColor.pink,
                    )
                  : null,
              hintText: 'Update Price',
              errorText: clubPageProvider.phone.error,
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: clubPageProvider.phoneController,
              onChanged: (String value) {
                clubPageProvider.checkPhone(value);
              },
              focusNode: clubPageProvider.phoneFocus,
              onEditingComplete: () {
                clubPageProvider.changeFocus(context, 'Phone');
              },
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        child: Column(
                      children: const [
                        Text(
                          'Status ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )),
                    const Padding(
                      padding: EdgeInsets.only(right: 35),
                    ),
                    const SizedBox(height: 30),
                    DropdownButton(
                        value: clubPageProvider.selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            clubPageProvider.selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, size.height * 0.07, 0, 0),
              child: ButtonDefault(
                width: 100,
                height: 29,
                content: 'Update',
                color: AppColor.white,
                backgroundBtn: AppColor.green,
                voidCallBack: () {
                  clubPageProvider.submitData(context);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

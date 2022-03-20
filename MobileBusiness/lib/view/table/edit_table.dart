import 'dart:developer';
import 'dart:io';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/model/response/get_bida_table_res.dart';
import 'package:booking_billiards_app/providers/table_page_provider.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:booking_billiards_app/widgets/upload_image/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditTablePage extends StatefulWidget {
  final GetBidaTableRes bidaTableDetail;
  const EditTablePage({Key? key, required this.bidaTableDetail})
      : super(key: key);

  @override
  State<EditTablePage> createState() => _EditTablePageState();
}

class _EditTablePageState extends State<EditTablePage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Ready"), value: "Active"),
      const DropdownMenuItem(child: Text("Occupied"), value: "Inactive"),
    ];

    return menuItems;
  }

  String selectedValue = "Active";

  @override
  Widget build(BuildContext context) {
    TablePageProvider tablePageProvider =
        Provider.of<TablePageProvider>(context);

        Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() {
          tablePageProvider.image = imageTemporary;
        });
      } catch (e) {
        log("Failed to pick image: $e");
      }
    }

    Size size = MediaQuery.of(context).size;
    double sizeHeightInput = size.height * 0.12;

    return Scaffold(
      backgroundColor: AppColor.lightGreen,
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
                  Navigator.pop(context);
                },
              )),
            ]),
            // Stack(
            //   children: [
            //     ClipRRect(
            //       borderRadius: BorderRadius.circular(8.0),
            //       child: Image.network(
            //         widget.bidaTableDetail.image!,
            //       ),
            //     ),
            //     Positioned(
            //       bottom: 0,
            //       right: 0,
            //       child: InkWell(
            //         onTap: () {
            //           showModalBottomSheet(
            //               context: context,
            //               builder: ((builder) => bottomSheet(context)));
            //         },
            //         child: const CircleAvatar(
            //           backgroundColor: Colors.white,
            //           child: Icon(
            //             Icons.camera_alt,
            //             size: 20,
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            UploadImage(
              widget: ClipRRect(
                  borderRadius: BorderRadius.circular(100 / 2),
                  child: tablePageProvider.image != null
                      ? Image.file(
                          tablePageProvider.image!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                      : (tablePageProvider.avatarTable != "null"
                          ? Image.network(
                              tablePageProvider.avatarTable!,
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
                  tablePageProvider.image = null;
                  tablePageProvider.avatarTable = "null";
                });
              }),
            // SizedBox(
            //   height: sizeHeightInput,
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       labelText: 'Table Name',
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: sizeHeightInput,
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       labelText: 'Price',
            //     ),
            //   ),
            // ),

            Column(
            children: <Widget>[
              InputDefault(
                title: 'Full Name',
                suffixIcon: tablePageProvider.textName.isNotEmpty
                    ? IconButton(
                        onPressed: () =>
                            tablePageProvider.clearNameController(),
                        icon: const Icon(Icons.clear_rounded),
                        color: AppColor.pink,
                      )
                    : null,
                hintText: 'Update Name',
                errorText: tablePageProvider.name.error,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: tablePageProvider.nameController,
                onChanged: (String value) {
                  tablePageProvider.checkName(value);
                },
                focusNode: tablePageProvider.nameFocus,
                onEditingComplete: () {
                  tablePageProvider.changeFocus(context, 'Name');
                },
              ),
              InputDefault(
                title: 'Price',
                suffixIcon: tablePageProvider.textPrice.isNotEmpty
                    ? IconButton(
                        onPressed: () =>
                            tablePageProvider.clearPriceController(),
                        icon: const Icon(Icons.clear_rounded),
                        color: AppColor.pink,
                      )
                    : null,
                hintText: 'Update Price',
                errorText: tablePageProvider.price.error,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: tablePageProvider.priceController,
                onChanged: (String value) {
                  tablePageProvider.checkPrice(value);
                },
                focusNode: tablePageProvider.nameFocus,
                onEditingComplete: () {
                  tablePageProvider.changeFocus(context, 'Price');
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
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
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.07, 0, 0),
                  child: ButtonDefault(
                    width: 100,
                    height: 29,
                    content: 'Update',
                    color: AppColor.white,
                    backgroundBtn: AppColor.green,
                    voidCallBack: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 125),
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.07, 0, 0),
                  child: ButtonDefault(
                    width: 100,
                    height: 29,
                    content: 'Delete',
                    color: AppColor.white,
                    backgroundBtn: AppColor.red,
                    voidCallBack: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }

  // Widget bottomSheet(context) {
  //   return Container(
  //     //height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         const Text(
  //           "Choose photo",
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.camera_alt),
  //           title: const Text('Camera'),
  //           onTap: () {
  //             // pickImage(ImageSource.camera);
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.image),
  //           title: const Text('Gallery'),
  //           onTap: () {
  //             // pickImage(ImageSource.gallery);
  //           },
  //         ),
  //         ListTile(
  //           leading: const Icon(Icons.delete),
  //           title: const Text('Remove'),
  //           // onTap: removeImage,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

import 'dart:developer';
import 'dart:io';

import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';
import 'package:booking_billiards_app/providers/new_table_provider.dart';
import 'package:booking_billiards_app/providers/table_page_provider.dart';
import 'package:booking_billiards_app/repository/impl/bida_club_rep_impl.dart';
import 'package:booking_billiards_app/repository/impl/bida_table_rep_impl.dart';
import 'package:booking_billiards_app/url_api/url_api.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:booking_billiards_app/widgets/upload_image/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddTablePage extends StatefulWidget {
  const AddTablePage({Key? key}) : super(key: key);

  @override
  State<AddTablePage> createState() => _AddTablePageState();
}

class _AddTablePageState extends State<AddTablePage> {
  @override
  Widget build(BuildContext context) {
    CreateTableProvider createTableProvider =
        Provider.of<CreateTableProvider>(context);

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() {
          createTableProvider.image = imageTemporary;
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
            Title(
                color: AppColor.green,
                child: Text(
                  "Create Your Table",
                  style: AppTextStyles.h2Black,
                )),
            UploadImage(
                widget: ClipRRect(
                    borderRadius: BorderRadius.circular(100 / 2),
                    child: createTableProvider.image != null
                        ? Image.file(
                            createTableProvider.image!,
                            fit: BoxFit.cover,
                            width: 400,
                            height: 200,
                          )
                        : const Image(
                            image: AssetImage(AssetPath.defaultPicture),
                            fit: BoxFit.cover,
                            width: 400,
                            height: 200,
                          )),
                pickImage: pickImage,
                removeImage: () {
                  setState(() {
                    createTableProvider.image = null;
                  });
                }),
            // SizedBox(
            //   height: sizeHeightInput,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       labelText: "Table name",
            //       errorText: createTableProvider.name.error,
            //     ),
            //     controller: createTableProvider.nameController,
            //     textInputAction: TextInputAction.next,
            //     onEditingComplete: () {
            //       createTableProvider.changeFocus(context, 'Name');
            //     },
            //     focusNode: createTableProvider.nameFocus,
            //     onChanged: (String value) {
            //       createTableProvider.checkName(value);
            //     },
            //   ),
            // ),
            InputDefault(
              title: 'Table name',
              suffixIcon: createTableProvider.textName.isNotEmpty
                  ? IconButton(
                      onPressed: () =>
                          createTableProvider.clearNameController(),
                      icon: const Icon(Icons.clear_rounded),
                      color: AppColor.pink,
                    )
                  : null,
              hintText: 'Name',
              errorText: createTableProvider.name.error,
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: createTableProvider.nameController,
              onChanged: (String value) {
                createTableProvider.checkName(value);
              },
              focusNode: createTableProvider.nameFocus,
              onEditingComplete: () {
                createTableProvider.changeFocus(context, 'Name');
              },
            ),
            // SizedBox(
            //   height: sizeHeightInput,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       labelText: "Price",
            //       errorText: createTableProvider.price.error,
            //     ),
            //     controller: createTableProvider.priceController,
            //     onEditingComplete: () {
            //       createTableProvider.changeFocus(context, 'Price');
            //     },
            //     onChanged: (String value) {
            //       createTableProvider.checkPrice(value);
            //     },
            //   ),
            // ),
            InputDefault(
              title: 'Price',
              suffixIcon: createTableProvider.textPrice.isNotEmpty
                  ? IconButton(
                      onPressed: () =>
                          createTableProvider.clearPriceController(),
                      icon: const Icon(Icons.clear_rounded),
                      color: AppColor.pink,
                    )
                  : null,
              hintText: 'Price',
              errorText: createTableProvider.price.error,
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: createTableProvider.priceController,
              onChanged: (String value) {
                createTableProvider.checkPrice(value);
              },
              focusNode: createTableProvider.priceFocus,
              onEditingComplete: () {
                createTableProvider.changeFocus(context, 'Price');
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, size.height * 0.07, 0, 0),
              child: ButtonDefault(
                width: 100,
                height: 29,
                content: 'Add',
                color: AppColor.white,
                backgroundBtn: AppColor.green,
                voidCallBack: () => {
                  createTableProvider.addData(context),
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

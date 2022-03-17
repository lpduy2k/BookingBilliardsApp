import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:flutter/material.dart';

class EditTablePage extends StatefulWidget {
  const EditTablePage({Key? key}) : super(key: key);

  @override
  State<EditTablePage> createState() => _EditTablePageState();
}

class _EditTablePageState extends State<EditTablePage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Ready"), value: "Active"),
      DropdownMenuItem(child: Text("Occupied"), value: "Inactive"),
    ];

    return menuItems;
  }

  String selectedValue = "Active";

  @override
  Widget build(BuildContext context) {
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://media.istockphoto.com/photos/3d-rendering-of-an-isolated-billiard-table-in-a-top-view-with-a-full-picture-id945650288?k=20&m=945650288&s=170667a&w=0&h=p0tphNgA9OnGaOGYpwDYKE2MPV5SjmIkgupkmD6TOpE=',
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
            SizedBox(
              height: sizeHeightInput,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Table Name',
                ),
              ),
            ),
            SizedBox(
              height: sizeHeightInput,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
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
                  padding: EdgeInsets.only(left: 155),
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

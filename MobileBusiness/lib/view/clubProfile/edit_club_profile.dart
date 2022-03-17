import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:booking_billiards_app/widgets/button/button.dart';
import 'package:booking_billiards_app/widgets/input/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditClubProfile extends StatefulWidget {
  const EditClubProfile({Key? key}) : super(key: key);

  @override
  State<EditClubProfile> createState() => _EditClubProfileState();
}

class _EditClubProfileState extends State<EditClubProfile> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Active"), value: "Active"),
      DropdownMenuItem(child: Text("Inactive"), value: "Inactive"),
    ];

    return menuItems;
  }

  String selectedValue = "Active";

  TimeOfDay time1 = const TimeOfDay(hour: 10, minute: 20);
  TimeOfDay time2 = const TimeOfDay(hour: 10, minute: 20);
  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(context);
                },
              )),
            ]),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://media-cdn.tripadvisor.com/media/photo-s/0d/c9/5b/eb/billiard-club-ripska.jpg',
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
                  labelText: 'Club Name',
                ),
              ),
            ),
            SizedBox(
              height: sizeHeightInput,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Opening time: ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        '${time1.hour.toString().padLeft(2, '0')}:${time1.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 13),
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
                            time1 = newTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Closing time: ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        '${time2.hour.toString().padLeft(2, '0')}:${time2.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 13),
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
                            time2 = newTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Phone number',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        height: size.height * 0.105,
                        width: size.width * 0.1,
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 13.5,
                            ),
                            Text(
                              '+84 ',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.105,
                      width: size.width - (40 + size.width * 0.1),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                      ),
                    ),
                  ],
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
            )
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

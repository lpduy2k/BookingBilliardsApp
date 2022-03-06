import 'package:booking_billiards_app/configs/themes/app_color.dart';
import 'package:booking_billiards_app/configs/themes/app_text_style.dart';
import 'package:booking_billiards_app/model/response/get_bida_club_res.dart';
import 'package:booking_billiards_app/utils/window_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatelessWidget {
  final List<GetBidaClubRes> listBidaClub;
  const Home({
    Key? key,
    required this.listBidaClub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> listImage = [
      'https://firebasestorage.googleapis.com/v0/b/bookingbilliardsapp.appspot.com/o/quangcao1.jpg?alt=media',
      'https://firebasestorage.googleapis.com/v0/b/bookingbilliardsapp.appspot.com/o/quangcao2.png?alt=media',
      'https://firebasestorage.googleapis.com/v0/b/bookingbilliardsapp.appspot.com/o/quangcao3.png?alt=media',
    ];
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: windowWidth * windowSizeWidth(20),
      ),
      color: AppColor.white,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Body(
            listImage: listImage,
            listBidaClub: listBidaClub,
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.listImage,
    required this.listBidaClub,
  }) : super(key: key);

  final List<String> listImage;
  final List<GetBidaClubRes> listBidaClub;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              const Header(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    hintText: 'Search',
                    prefixIcon: const Padding(
                      padding: EdgeInsetsDirectional.only(start: 20, top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.search,
                        size: 20,
                      ),
                    ),
                    hintStyle: AppTextStyles.h5Black,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: listImage
                    .map(
                      (e) => BuildImage(urlImage: e),
                    )
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  height: 100,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Today New Arivable',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Best of the today billiards club list update',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyle(color: AppColor.pink),
                            ),
                            Icon(
                              MdiIcons.menuRight,
                              color: AppColor.pink,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(200),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var list in listBidaClub)
                      SizedBox(
                        child: GestureDetector(
                          onTap: () => print('ok'),
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    list.image!,
                                    height:
                                        windowHeight * windowSizeHeight(125),
                                    width: windowWidth * windowSizeWidth(150),
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    list.name!.length < 22
                                        ? list.name!
                                        : list.name!.substring(0, 20) + "...",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        size: 15,
                                        color: AppColor.pink,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 3),
                                      ),
                                      Text(
                                        list.address!.length < 28
                                            ? list.address!
                                            : list.address!.substring(0, 26) +
                                                "...",
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Booking Billiard Club',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '  Check your city Near by Club',
                        style: TextStyle(fontSize: 12, color: AppColor.pink),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(color: AppColor.pink),
                        ),
                        Icon(
                          MdiIcons.menuRight,
                          color: AppColor.pink,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: windowHeight * windowSizeHeight(300),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    for (var list in listBidaClub.reversed)
                      GestureDetector(
                        onTap: () {
                          print('ok');
                        },
                        child: Card(
                          elevation: 8,
                          child: ListTile(
                            leading: Image.network(
                              list.image!,
                              width: windowWidth * windowSizeWidth(60),
                            ),
                            title: Text(
                              list.name!.length < 28
                                  ? list.name!
                                  : list.name!.substring(0, 26) + "...",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                  size: 15,
                                  color: AppColor.pink,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 3),
                                ),
                                Text(
                                  list.address!.length < 33
                                      ? list.address!
                                      : list.address!.substring(0, 31) + "...",
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(MdiIcons.menu),
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 15,
              color: AppColor.pink,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5),
            ),
            const Text('467 Tân Sơn, Gò Vấp'),
          ],
        ),
        const Icon(MdiIcons.accountCircle),
      ],
    );
  }
}

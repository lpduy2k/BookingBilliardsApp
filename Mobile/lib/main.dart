import 'package:booking_billiards_app/view/onboarding/onboarding.dart';
import 'package:booking_billiards_app/view/rootPage/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking App',
      initialRoute: "/",
      routes: {
        "/": (context) => const Onboarding(),
      },
    );
  }
}

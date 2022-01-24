import 'package:booking_billiards_app/configs/routes/routes_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking Billiards App',
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRouter,
    );
  }
}

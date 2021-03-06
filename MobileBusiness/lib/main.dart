import 'package:booking_billiards_app/configs/routes/routes_generator.dart';
import 'package:booking_billiards_app/providers/main_providers/main_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MainProviders.providers,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booking Billiards App',
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRouter,
      ),
    );
  }
}

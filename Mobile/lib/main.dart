import 'package:booking_billiards_app/configs/routes/routes_generator.dart';
import 'package:booking_billiards_app/view_model/providers/main_providers/main_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

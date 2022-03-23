import 'package:booking_billiards_app/configs/routes/routes_generator.dart';
import 'package:booking_billiards_app/view_model/providers/main_providers/main_providers.dart';
import 'package:booking_billiards_app/view_model/url_api/notification_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init();
  }
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

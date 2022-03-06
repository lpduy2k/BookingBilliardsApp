import 'package:flutter/material.dart';
import 'package:booking_billiards_app/constants/assets_path.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Root Page"),
      ),
      body: Column(
        children: [Image.asset(AssetPath.logo)],
      ),
    );
  }
}

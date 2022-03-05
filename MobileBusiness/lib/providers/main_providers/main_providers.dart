import 'package:booking_billiards_app/providers/sign_in_provider.dart';
import 'package:booking_billiards_app/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
    ),
    ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
    )
  ];
}

import 'package:booking_billiards_app/view_model/providers/google_signin_provider.dart';
import 'package:booking_billiards_app/view_model/providers/input_pin_code_provider.dart';
import 'package:booking_billiards_app/view_model/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/view_model/providers/sign_in_provider.dart';
import 'package:booking_billiards_app/view_model/providers/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
    ),
    ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
    ),
    ChangeNotifierProvider<ProfilePageProvider>(
      create: (context) => ProfilePageProvider(),
    ),
    ChangeNotifierProvider<InputPinCodeProvider>(
      create: (context) => InputPinCodeProvider(),
    ),
    ChangeNotifierProvider<GoogleSignInProvider>(
      create: (context) => GoogleSignInProvider(),
    ),
  ];
}

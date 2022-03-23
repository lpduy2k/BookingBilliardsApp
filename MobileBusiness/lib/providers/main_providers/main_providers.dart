import 'package:booking_billiards_app/providers/change_pass_provider.dart';
import 'package:booking_billiards_app/providers/club_page_provider.dart';
import 'package:booking_billiards_app/providers/input_pin_code_provider.dart';
import 'package:booking_billiards_app/providers/new_table_provider.dart';
import 'package:booking_billiards_app/providers/profile_page_provider.dart';
import 'package:booking_billiards_app/providers/sign_in_provider.dart';
import 'package:booking_billiards_app/providers/sign_up_provider.dart';
import 'package:booking_billiards_app/providers/table_page_provider.dart';
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
    ChangeNotifierProvider<TablePageProvider>(
      create: (context) => TablePageProvider(),
    ),
    ChangeNotifierProvider<CreateTableProvider>(
      create: (context) => CreateTableProvider(),
    ),
    ChangeNotifierProvider<ClubPageProvider>(
      create: (context) => ClubPageProvider(),
    ),
    ChangeNotifierProvider<ChangePassProvider>(
      create: (context) => ChangePassProvider(),
    ),
  ];
}

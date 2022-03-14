import 'package:booking_billiards_app/view/accountPage/account.dart';
import 'package:booking_billiards_app/view/bottomNavBar/bottomNavBar.dart';
import 'package:booking_billiards_app/view/clubProfile/club_profile.dart';
import 'package:booking_billiards_app/view/clubProfile/edit_club_profile.dart';
import 'package:booking_billiards_app/view/forgetPassword/change_new_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/historyPage/history.dart';
import 'package:booking_billiards_app/view/homePage/home.dart';
import 'package:booking_billiards_app/view/success/success.dart';
import 'package:booking_billiards_app/view/onboarding/onboarding.dart';
import 'package:booking_billiards_app/view/welcome/welcome.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Onboarding(),
        );
      case '/welcome':
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        );
      case '/forgetPassword':
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case '/inputPinCode':
        return MaterialPageRoute(
          builder: (_) => const InputPinCode(),
        );
      case '/changeNewPassword':
        return MaterialPageRoute(
          builder: (_) => const ChangeNewPassword(),
        );
      case '/success':
        return MaterialPageRoute(
          builder: (_) => const SuccessPage(),
        );
      case '/bottomNavBar':
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const AccountPage(),
        );
      case '/clubprofile':
        return MaterialPageRoute(
          builder: (_) => const ClubProfile(),
        );
      case '/editclubprofile':
        return MaterialPageRoute(
          builder: (_) => const EditClubProfile(),
        );
      case '/history':
        return MaterialPageRoute(
          builder: (_) => const HistoryPage(),
        );
      default:
        return _errorRouter();
    }
  }

  static Route<dynamic> _errorRouter() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

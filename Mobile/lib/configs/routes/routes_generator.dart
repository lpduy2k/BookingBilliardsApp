import 'package:booking_billiards_app/view/changePassword/change_new_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/profilePage/profilePage.dart';
import 'package:booking_billiards_app/view/search/search_bida_club.dart';
import 'package:booking_billiards_app/view/success/success.dart';
import 'package:booking_billiards_app/view/onboarding/onboarding.dart';
import 'package:booking_billiards_app/view/welcome/welcome_screen.dart';
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
          builder: (_) => const WelcomeScreen(),
        );
      case '/changeNewPassword':
        return MaterialPageRoute(
          builder: (_) => const ChangeNewPassword(),
        );
      case '/inputPinCode':
        return MaterialPageRoute(
          builder: (_) => const InputPinCode(),
        );
      case '/forgetPassword':
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case '/success':
        return MaterialPageRoute(
          builder: (_) => const SuccessPage(),
        );
      case '/searchBidaClub':
        return MaterialPageRoute(
          builder: (_) => const SearchBidaClub(),
        );
      case '/profilePage':
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
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

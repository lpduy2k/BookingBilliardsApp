import 'package:booking_billiards_app/view/forgetPassword/change_new_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/forget_password.dart';
import 'package:booking_billiards_app/view/forgetPassword/input_pin_code.dart';
import 'package:booking_billiards_app/view/forgetPassword/success_forget_password.dart';
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
      case '/successForgetPassword':
        return MaterialPageRoute(
          builder: (_) => const SuccessForgetPassword(),
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

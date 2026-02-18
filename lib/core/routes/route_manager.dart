import 'package:auth/presentation/auth/forgot/view/forgot_email.dart';
import 'package:auth/presentation/auth/forgot/view/forgot_otp.dart';
import 'package:auth/presentation/auth/forgot/view/reset_password.dart';
import 'package:auth/presentation/auth/signup/view/signup_otp.dart';
import 'package:auth/presentation/auth/signup/view/signup_screen.dart';
import 'package:auth/presentation/auth/login/view/login_screen.dart';
import 'package:auth/presentation/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String login = "/login";
  static const String home = "/home";
  static const String signup = "/signup";
  static const String signupOtp = "/signupOtp";
  static const String forgotOtp = "/forgotOtp";
  static const String forotEmail = "/forotEmail";
  static const String resetPassword = "/resetPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.signupOtp:
        return MaterialPageRoute(builder: (_) => const SignupOtp());
      case Routes.forgotOtp:
        return MaterialPageRoute(builder: (_) => const ForgotOtp());
      case Routes.forotEmail:
        return MaterialPageRoute(builder: (_) => const ForgotEmail());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Center(child: Text('NO ROUTES FOUND'))),
    );
  }
}

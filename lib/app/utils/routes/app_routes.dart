import 'package:ecommerceapp/app/features/auth/screens/login/login_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/signup/signup_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  // Auth Routes
  AppRoutes._();
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String login = '/signin';
  static const String forget = '/forget';
  static const String changePassword = '/changePassword';
  static const String otp = '/otp';

  static final routes = [
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: login, page: () => LoginScreen()),
  ];
}

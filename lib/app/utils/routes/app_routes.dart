import 'package:ecommerceapp/app/features/auth/screens/login/login_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/password_configuration/forget_password_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/password_configuration/reset_password_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/signup/signup_screen.dart';
import 'package:ecommerceapp/app/common/widgets/login_signup/sucess_screen.dart';
import 'package:ecommerceapp/app/features/auth/screens/signup/verify_email_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/favourite/favourite_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/home_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/shop/shop_screen.dart';
import 'package:ecommerceapp/app/navigation_menu.dart';
import 'package:get/get.dart';

class Routes {
  // Auth Routes
  Routes._();
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String login = '/signin';
  static const String verifyEmail = '/verifyEmail';
  static const String succuessScreen = '/succuessScreen';
  static const String forget = '/forget';
  static const String resetPasswordSuccuess = '/resetPasswordSuccuess';
  static const String navigator = '/navigator';
  static const String home = '/home';
  static const String shop = '/shop';
  static const String favourite = '/favourite';

  static final routes = [
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: forget, page: () => const ForgetPasswordScreen()),
    GetPage(name: navigator, page: () => NavigationMenu()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: shop, page: () => ShopScreen()),
    GetPage(name: favourite, page: () => FavouriteScreen()),

    GetPage(
      name: succuessScreen,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return SucessScreen(
          image: args['image'] ?? '',
          title: args['title'] ?? '',
          subTitle: args['subTitle'] ?? '',
          btnText: args['btnText'] ?? '',
          onPressed: args['onPressed'] ?? () {},
        );
      },
    ),

    GetPage(
      name: resetPasswordSuccuess,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ResetPasswordSuccuessScreen(
          image: args['image'] ?? '',
          title: args['title'] ?? '',
          subTitle: args['subTitle'] ?? '',
          button1Text: args['button1Text'] ?? '',
          button2Text: args['button2Text'] ?? '',
          onPressed: args['onPressed'] ?? () {},
          onPressed2: args['onPressed2'] ?? () {},
        );
      },
    ),
  ];
}

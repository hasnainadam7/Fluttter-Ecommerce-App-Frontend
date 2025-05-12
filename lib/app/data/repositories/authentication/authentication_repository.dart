import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/auth/screens/login/login_screen.dart';
import '../../../features/auth/screens/onboarding/onboarding_screen.dart';
import '../../../features/auth/screens/signup/verify_email_screen.dart';
import '../../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser=> _auth.currentUser;

  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  /// Called from main.dart app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to show relevant screen
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser!.email ?? ""));

      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(
            () => const LoginScreen(),
          ) // Redirect to the Login Screen if not the first time
          : Get.offAll(
            () => OnboardingScreen(),
          ); // Redirect to the OnBoarding Screen if not the first time
    }
  }

  /* --------------------- Email & Password sign-in ------------------------- */

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    return firebaseAuthHandler(
      () async => await _auth.signInWithEmailAndPassword(email: email, password: password),
    );
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    return await firebaseAuthHandler(() async {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if email is not verified
      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification(); // send verification link
      }

      return userCredential;
    });
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    return firebaseAuthHandler(() async => await _auth.currentUser!.sendEmailVerification());
  }


  /// [ReAuthentication] - ReAuthenticate User
  /// [EmailAuthentication] - Forgot Password
  Future<void> forgotPassword(String email) async => firebaseAuthHandler(() async {
    await _auth.sendPasswordResetEmail(email: email);
  });

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> loginWithGoogle() async {
    return await firebaseAuthHandler(() async {
      try {
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

        if (userAccount != null) {
          final auth = await userAccount.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken,
          );

          final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
          return userCredential;
        } else {
          return null;
        }
      } catch (e) {
        return null;
      }
    });
  }

  /// [FacebookAuthentication] - FACEBOOK
  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async => firebaseAuthHandler(() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  });

  /// DELETE USER - Remove user Auth & Firebase Account

  ///Re Usable Function Higher Order Function
  Future<T> firebaseAuthHandler<T>(Future<T> Function() authFunction) async {
    try {
      return await authFunction();
    }
    // on FirebaseAuthException catch (e) {
    //   throw Exception(CFirebaseException(e.code).message);
    // } on FirebaseException catch (e) {
    //   throw Exception(CFirebaseException(e.code).message);
    // } on FormatException catch (_) {
    //   throw Exception(CFormatException());
    // } on PlatformException catch (e) {
    //   throw Exception(CPlatformException(e.code).message);
    // }
    catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
}

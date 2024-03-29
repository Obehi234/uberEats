import 'dart:developer';

import 'package:delivery_app/constant/constant.dart';
import 'package:delivery_app/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:delivery_app/view/authScreens/mobileLogInScreen.dart';
import 'package:delivery_app/view/authScreens/otpScreen.dart';
import 'package:delivery_app/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:delivery_app/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MobileAuthServices {
  static bool checkAuthentication(
    BuildContext context,
  ) {
    User? user = auth.currentUser;

    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileLoginScreen()),
          (route) => false);
      return false;
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const BottomNavigationBarUberEats()),
        (route) => false);
    return true;
  }

  static receiveOTP(BuildContext context, String mobileNo) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credentials) {
          log(credentials.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
          throw Exception(exception);
        },
        codeSent: (String verificationID, int? resendOTP) {
          context
              .read<MobileAuthProvider>()
              .updateVerificationID(verificationID);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OTPScreen()),
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: context.read<MobileAuthProvider>().verificationID!,
          smsCode: otp);
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
            child: const SignInLogicScreen(),
            type: PageTransitionType.rightToLeft),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

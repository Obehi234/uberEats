import 'package:flutter/material.dart';

class MobileAuthProvider extends ChangeNotifier {
  String? mobileNumber;
  String? verificationID;

  updateVerificationID(String verification) {
    verificationID = verification;
    notifyListeners();
  }

  updateMobileNumber(String newMobileNumber){
    mobileNumber = newMobileNumber;
    notifyListeners();
  }
}

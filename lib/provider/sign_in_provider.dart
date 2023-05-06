import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  bool isSigningIn = false;

  String? verificationId;
  String authStatus = "";
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  void loading(bool value) {
    isSigningIn = value;
    notifyListeners();
  }

  void setAuthStatus(String status) {
    authStatus = status;
    notifyListeners();
  }

  void setVerificationId(String verId) {
    verificationId = verId;
    notifyListeners();
  }

  void setOtp(String value) {
    otpController.text = value;
    notifyListeners();
  }

  

}

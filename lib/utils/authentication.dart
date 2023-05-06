// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:assignment_test_for_the_zartek/provider/sign_in_provider.dart';
import 'package:assignment_test_for_the_zartek/view%20model/sign_in_screen.dart';
import 'package:assignment_test_for_the_zartek/widgets/otp_pop_up_dialoge.dart';
import 'package:assignment_test_for_the_zartek/widgets/snack_bars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Initilizing firebase for application
  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  /// Google sign In
  static Future signInWithGoogle({required BuildContext context}) async {
    // begin signing prcess
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // create a  new credintial for user
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      log(userCredential.user?.displayName.toString() ?? 'empty');
    }

    // firebase exceptions
    on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBars.signup(
            content: 'The account already exists with a different credential.',
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBars.signup(
            content: 'Error occurred while accessing credentials. Try again.',
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.signup(
          content: e.toString(),
        ),
      );
    }
  }

  /// Google sign Out
  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // log out from google account and firebase
      googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      // success message
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.signup(
          content: 'signing out',
        ),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const SignInScreen(),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBars.signup(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  ///--------------------------Siging with Mobile phone Number------------------------
  ///

  Future verifyPhoneNumber(formKey2, context) async {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    provider.loading(true);

    final phoneNumber = '+91${provider.mobileNumberController.text.trim()}';

    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: phoneNumber.trim(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.of(context).pop();
        provider.setVerificationId(verificationId);

        showOtpBottomSheet(formKey2, context);
        // Create a PhoneAuthCredential with the code

        log("Ottp sended");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    provider.loading(false);
  }
}

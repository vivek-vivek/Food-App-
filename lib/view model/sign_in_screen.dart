import 'dart:developer';

import 'package:assignment_test_for_the_zartek/assets/asset_names.dart';
import 'package:assignment_test_for_the_zartek/res/custom_colors.dart';
import 'package:assignment_test_for_the_zartek/utils/debug_print.dart';
import 'package:assignment_test_for_the_zartek/widgets/phone_number_sign_in_button.dart';
import 'package:flutter/material.dart';

import '../utils/authentication.dart';
import '../widgets/google_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          Assets.firebaseLogo,
                          height: 160,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Firebase',
                        style: TextStyle(
                          color: CustomColors.firebaseYellow,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Authentication',
                        style: TextStyle(
                          color: CustomColors.firebaseOrenge,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Phone number sign in
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      DebugService().debugPrintStack(
                          label: snapshot.error.toString(), maxFrames: 1000);
                      return const Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const PhoneNumberSignInButton();
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomColors.firebaseOrenge,
                      ),
                    );
                  },
                ),

                // Google sign in
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      DebugService().debugPrintStack(
                          label: snapshot.error.toString(), maxFrames: 1000);
                      return const Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const GoogleSignInButton();
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomColors.firebaseOrenge,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

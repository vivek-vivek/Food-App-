// ignore_for_file: use_build_context_synchronously

import 'package:assignment_test_for_the_zartek/assets/asset_names.dart';
import 'package:assignment_test_for_the_zartek/provider/sign_in_provider.dart';
import 'package:assignment_test_for_the_zartek/widgets/phone_number_sign_in_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumberSignInButton extends StatefulWidget {
  const PhoneNumberSignInButton({super.key});

  @override
  PhoneNumberSignInButtonState createState() => PhoneNumberSignInButtonState();
}

class PhoneNumberSignInButtonState extends State<PhoneNumberSignInButton> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
    final provider = Provider.of<SignInProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: provider.isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () {
                showAddMobilenumberBottomSheet(_formKey,_formKey2, context);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Image(
                        image: AssetImage(Assets.phoneLogo),
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Phone number',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

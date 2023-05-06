import 'package:assignment_test_for_the_zartek/provider/sign_in_provider.dart';
import 'package:assignment_test_for_the_zartek/utils/authentication.dart';
import 'package:assignment_test_for_the_zartek/view%20model/user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showOtpBottomSheet(GlobalKey<FormState> formKey, context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const Text(
            "Verify Your Phone Number",
            style: TextStyle(fontSize: 24.0),
          ),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mension Your Mobile Number",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:
                            Provider.of<SignInProvider>(context).otpController,
                        validator: (value) {
                          if (value == '') {
                            return 'Invalid otp number';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          floatingLabelStyle: TextStyle(color: Colors.white60),
                          labelText: 'Mobile Number',
                          hintStyle: TextStyle(fontSize: 8),
                        ),
                        maxLength: 6,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (_) => LoginPage(),
                            // ));
                            final provider = Provider.of<SignInProvider>(
                                context,
                                listen: false);

                            print(provider.otpController.text);
                            print(provider.verificationId!);
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: provider.verificationId!,
                                    smsCode: provider.otpController.text);

                            // Sign the user in (or link) with the credential
                            await FirebaseAuth.instance
                                .signInWithCredential(credential)
                                .then((value) => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (_) => UserInfoScreen(),
                                    )));
                          }
                        },

                        // style: ElevatedButton.styleFrom(
                        //   backgroundColor: Colors.black,
                        //   fixedSize: const Size(250, 50),
                        // ),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child:
                                Provider.of<SignInProvider>(context).isSigningIn
                                    ? const CircularProgressIndicator(
                                        color: Colors.black)
                                    : const Text(
                                        "Verify",
                                        style: TextStyle(color: Colors.black),
                                      ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

SnackBar snk() {
  return const SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.black,
    content: Text(
      'sucess',
      style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}

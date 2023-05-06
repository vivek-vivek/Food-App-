import 'package:assignment_test_for_the_zartek/provider/sign_in_provider.dart';
import 'package:assignment_test_for_the_zartek/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showAddMobilenumberBottomSheet(
    GlobalKey<FormState> formKey, GlobalKey<FormState> formKey2, context) {
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
            "Sign In",
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
                        controller: Provider.of<SignInProvider>(context)
                            .mobileNumberController,
                        validator: (value) {
                          if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value!)) {
                            return 'Invalid mobile number';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefix: Text(
                            '+91',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          floatingLabelStyle: TextStyle(color: Colors.white60),
                          labelText: 'Mobile Number',
                          hintStyle: TextStyle(fontSize: 8),
                        ),
                        maxLength: 10,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (_) => LoginPage(),
                            // ));

                            Authentication()
                                .verifyPhoneNumber(formKey2, context);
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
                                        "Submit",
                                        style: TextStyle(color: Colors.black),
                                      ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Note'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                        ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud'
                        ' exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
                        'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,'
                        ' sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(fontSize: 12),
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

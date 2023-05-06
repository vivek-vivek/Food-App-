import 'package:assignment_test_for_the_zartek/utils/authentication.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
            onPressed: () => Authentication.signOut(context: context),
            child:const Text("signout")),
      ),
    );
  }
}

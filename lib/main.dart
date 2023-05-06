import 'package:assignment_test_for_the_zartek/provider/sign_in_provider.dart';
import 'package:assignment_test_for_the_zartek/view%20model/sign_in_screen.dart';
import 'package:assignment_test_for_the_zartek/view%20model/user_info_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInProvider>(
            create: (context) => SignInProvider())
      ],
      child: MaterialApp(
        title: 'unknown',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, usersnapshort) {
            if (usersnapshort.hasData) {
              return const UserInfoScreen();
            }
            return const SignInScreen();
          },
        ),
      ),
    );
  }
}

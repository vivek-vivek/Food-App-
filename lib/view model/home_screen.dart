import 'dart:developer';

import 'package:assignment_test_for_the_zartek/provider/cart_provider.dart';
import 'package:assignment_test_for_the_zartek/provider/home_provider.dart';
import 'package:assignment_test_for_the_zartek/res/custom_colors.dart';
import 'package:assignment_test_for_the_zartek/res/services/home_screen_services.dart';
import 'package:assignment_test_for_the_zartek/utils/authentication.dart';
import 'package:assignment_test_for_the_zartek/view%20model/cart_screen.dart';
import 'package:assignment_test_for_the_zartek/widgets/sizers.dart';
import 'package:assignment_test_for_the_zartek/widgets/tabars/salads_and_soups.dart';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    HomeApiServices().getDishDetailes(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.white,
        appBar: AppBar(
          backgroundColor: CustomColors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 10),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red.withOpacity(.8),
                      child: Consumer<CartProvider>(
                          builder: (context, value, child) {
                        return Text(
                          "${value.items.length}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Provider.of<HomeProvider>(context).isLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelColor:
                        Colors.pink, // sets the text color of the selected tab
                    unselectedLabelColor: Colors
                        .black54, // sets the text color of unselected tabs
                    indicatorColor: Colors.pink,
                    tabs: const [
                      Tab(text: 'Salads and Soup'),
                      Tab(text: 'From The Barnyard'),
                      Tab(text: 'From the Ice creams')
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        SaladsAndSoups(),
                        ModelTabView(),
                        ModelTabView(),
                      ],
                    ),
                  ),
                ],
              ),
        drawer: ProfileDrawer());
  }
}

class ModelTabView extends StatelessWidget {
  const ModelTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is Tab 2',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  User? user;
  bool isGoogleSignIn = false;

  ProfileDrawer({
    Key? key,
  }) : super(key: key) {
    user = FirebaseAuth.instance.currentUser;
    isGoogleSignIn = user?.providerData[0].providerId == 'google.com';
  }

  String getUserName() {
    if (user != null) {
      if (isGoogleSignIn) {
        return user!.displayName ?? 'Google User';
      } else {
        return user!.phoneNumber ?? 'Phone User';
      }
    } else {
      return 'Guest';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 10, 144, 15),
                  Color.fromARGB(255, 139, 234, 61)
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    user?.photoURL ??
                        'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                  ),
                ),
                kHeight10,
                Text(
                  getUserName(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                kHeight5,
                Text(
                  'UID: ${user?.uid ?? 'N/A'}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          kHeight10,
          kHeight10,
          ListTile(
            onTap: () {
              Authentication.signOut(context: context);
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cacapp/widget/bottom_action_button.dart';
import 'package:cacapp/widget/main_top_bar.dart';
import 'package:flutter/material.dart';

import 'package:cacapp/screen/friends_screen.dart';
import 'package:cacapp/screen/groups_screen.dart';
import 'package:cacapp/screen/info_screen_dart.dart';
import 'package:cacapp/screen/reports_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: MainTopBar(
          totalReports: 10,
        ),
      ),
      body: const Center(),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomActionButton(
              icon: 'friends.png',
              label: 'Friends',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, FriendsScreen.route);
              },
              showNotification: false,
            ),
            BottomActionButton(
              icon: 'group.png',
              label: 'Groups',
              color: Colors.purple,
              onPressed: () {
                Navigator.pushNamed(context, GroupsScreen.route);
              },
              showNotification: false,
            ),
            BottomActionButton(
              icon: 'cup.png',
              label: 'Ranking',
              color: Colors.yellow,
              onPressed: () {},
              showNotification: false,
            ),
            BottomActionButton(
              icon: 'info.png',
              label: 'Info',
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, InfoScreen.route);
              },
              showNotification: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

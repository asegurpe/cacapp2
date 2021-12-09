import 'package:flutter/material.dart';
import 'package:cacapp/screen/friends_screen.dart';
import 'package:cacapp/screen/groups_screen.dart';
import 'package:cacapp/screen/home_screen.dart';
import 'package:cacapp/screen/info_screen_dart.dart';
import 'package:cacapp/screen/reports_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    ReportsScreen.route: (context) => const ReportsScreen(),
    FriendsScreen.route: (context) => const FriendsScreen(),
    GroupsScreen.route: (context) => const GroupsScreen(),
    InfoScreen.route: (context) => const InfoScreen(),
  };
}

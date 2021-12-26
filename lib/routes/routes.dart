import 'package:flutter/material.dart';

import 'package:cacapp/screen/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    LoginScreen.route: (context) => const LoginScreen(),
    RegisterScreen.route: (context) => const RegisterScreen(),
    HomeScreen.route: (context) => const HomeScreen(),
    ReportsScreen.route: (context) => const ReportsScreen(),
    FriendsScreen.route: (context) => const FriendsScreen(),
    GroupsScreen.route: (context) => const GroupsScreen(),
    InfoScreen.route: (context) => const InfoScreen(),
    ProfileScreen.route: (context) => const ProfileScreen(),
    RankingScreen.route: (context) => const RankingScreen(),
  };
}

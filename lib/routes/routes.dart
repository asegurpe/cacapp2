import 'package:cacapp/screen/home_screen.dart';
import 'package:cacapp/screen/reports_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    HomeScreen.route: (context) => const HomeScreen(),
    ReportsScreen.route: (context) => const ReportsScreen(),
  };
}

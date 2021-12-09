import 'package:cacapp/screen/home_screen.dart';
import 'package:cacapp/screen/reports_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CacApp());

class CacApp extends StatelessWidget {
  const CacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CacApp',
      //home: HomeScreen(),
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        ReportsScreen.route: (context) => const ReportsScreen(),
      },
    );
  }
}

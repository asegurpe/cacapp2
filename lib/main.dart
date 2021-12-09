import 'package:cacapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:cacapp/routes/routes.dart';
import 'package:cacapp/screen/home_screen.dart';

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
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      },
      theme: theme,
    );
  }
}

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
        print('${settings.name}');
        return MaterialPageRoute(builder: (context) => HomeScreen());
      },
    );
  }
}

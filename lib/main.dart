import 'package:cacapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cacapp/routes/routes.dart';
import 'package:cacapp/screen/home_screen.dart';

void main() => runApp(const CacApp());

class CacApp extends StatelessWidget {
  const CacApp({Key? key}) : super(key: key);

  static const Locale locale = Locale('ca');

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
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
        Locale('en'),
        Locale('es'),
      ],
      locale: locale,
    );
  }
}

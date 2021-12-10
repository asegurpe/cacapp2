import 'package:cacapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cacapp/routes/routes.dart';
import 'package:cacapp/screen/home_screen.dart';

void main() => runApp(const CacApp());

class CacApp extends StatefulWidget {
  const CacApp({Key? key}) : super(key: key);

  @override
  State<CacApp> createState() => _CacAppState();

  static void setLocale(BuildContext context, Locale newLocale) async {
    _CacAppState? state = context.findAncestorStateOfType<_CacAppState>();
    state!.changeLanguage(newLocale);
  }
}

class _CacAppState extends State<CacApp> {
  Locale _locale = Locale('ca');
  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
        Locale('ca'),
        Locale('es'),
        Locale('en'),
      ],
      locale: _locale,
    );
  }
}

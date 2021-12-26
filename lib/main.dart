import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cacapp/routes/routes.dart';
import 'package:cacapp/screen/login_screen.dart';
import 'package:cacapp/screen/home_screen.dart';
import 'package:cacapp/theme/theme.dart';
import 'package:cacapp/provider/report_provider.dart';
import 'package:cacapp/util/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences preferences = Preferences();
  await preferences.init();
  preferences.userId = 'lbABclXAgNJib9NVIPQJ';
  await Firebase.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReportProvider(),
          lazy: false,
        ),
      ],
      child: const CacApp(),
    );
  }
}

class CacApp extends StatefulWidget {
  const CacApp({Key? key}) : super(key: key);

  @override
  State<CacApp> createState() => _CacAppState();

  static void setLocale(BuildContext context, Locale? newLocale) async {
    _CacAppState? state = context.findAncestorStateOfType<_CacAppState>();
    state!.changeLanguage(newLocale);
  }
}

class _CacAppState extends State<CacApp> {
  late Locale? _locale;

  changeLanguage(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    String languageCode = Preferences().languageCode;
    _locale = languageCode.isEmpty ? null : Locale(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CacApp',
      //home: HomeScreen(),
      initialRoute: LoginScreen.route,
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

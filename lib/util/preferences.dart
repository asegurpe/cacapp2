import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get languageCode {
    return _prefs.getString('languageCode') ?? '';
  }

  set languageCode(String? value) {
    if (value == null) {
      _prefs.remove('languageCode');
    } else {
      _prefs.setString('languageCode', value);
    }
  }

  String get userId {
    return _prefs.getString('userId') ?? '';
  }

  set userId(String? value) {
    if (value == null) {
      _prefs.remove('userId');
    } else {
      _prefs.setString('userId', value);
    }
  }
}

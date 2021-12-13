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
    // for (String key in _prefs.getKeys()) {
    //   _prefs.remove(key);
    // }
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
}

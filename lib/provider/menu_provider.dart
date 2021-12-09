// Read a json file
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('assets/json/menu_opts.json');
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];
    return options;
  }
}

// Singleton
final menuProvider = _MenuProvider();

import 'dart:convert';
import 'package:flutter/services.dart';

class Utils {
  static Future<List<dynamic>> loadSurahJson() async {
    final String jsonString = await rootBundle.loadString('assets/surah.json');
    return json.decode(jsonString);
  }

  static Future<List<dynamic>> loadTafseerJson() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString);
  }
}

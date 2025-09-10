import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({required String key, required dynamic value}) async {
    if (_sharedPreferences == null) return;
    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences!.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    if (_sharedPreferences == null) return null;
    return _sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    if (_sharedPreferences == null) return false;
    return await _sharedPreferences!.remove(key);
  }

  static Future<bool> clearData() async {
    if (_sharedPreferences == null) return false;
    return await _sharedPreferences!.clear();
  }
}

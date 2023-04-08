import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._internal();
  static late Storage _instance;
  static Storage get instance => _instance;

  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    await getInstance();
    _instance = Storage._internal();
  }

  static Future<void> getInstance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> write(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String> read(String key) async {
    return Future.value(_prefs.getString(key));
  }

  Future<bool> hasKey(String key) async {
    return Future.value(_prefs.containsKey(key));
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<void> removeKey(String key) async {
    await _prefs.remove(key);
  }
}

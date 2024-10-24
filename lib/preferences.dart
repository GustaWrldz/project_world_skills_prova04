import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;

  Future<void> getPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setId(String key, int value) async {
    await getPreferences();
    await _preferences!.setInt(key, value);
  }

  Future<void> setString(String key, String value) async {
    await getPreferences();
    await _preferences!.setString(key, value);
  }

  Future<String?> getString(String key) async {
    await getPreferences();
    return _preferences!.getString(key);
  }
}

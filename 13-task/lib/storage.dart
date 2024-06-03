import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  static const _themeKey = 'theme';
  static const _schemeKey = 'scheme';

  Future<void> saveTheme(int themeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, themeIndex);
  }

  Future<void> saveScheme(int schemeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_schemeKey, schemeIndex);
  }

  Future<int> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_themeKey) ?? 0;
  }

  Future<int> loadScheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_schemeKey) ?? 0;
  }
}


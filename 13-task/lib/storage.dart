import 'package:hive/hive.dart';

class StorageService {
  static const _themeKey = 'theme';
  static const _schemeKey = 'scheme';
  final Box<int> _settingsBox = Hive.box<int>('settings');

  Future<void> saveTheme(int themeIndex) async {
    await _settingsBox.put(_themeKey, themeIndex);
  }

  Future<void> saveScheme(int schemeIndex) async {
    await _settingsBox.put(_schemeKey, schemeIndex);
  }

  int loadTheme() {
    return _settingsBox.get(_themeKey, defaultValue: 0)!;
  }

  int loadScheme() {
    return _settingsBox.get(_schemeKey, defaultValue: 0)!;
  }
}

import 'package:flutter/material.dart';
import 'package:new_task13/data/storage.dart';
import 'package:new_task13/uikit/theme/theme.dart';

enum AppTheme { system, dark, light }
enum ColorSchemeType { green, blue, orange }

class ThemeNotifier extends ChangeNotifier {
  final StorageService _storageService;

  AppTheme _theme = AppTheme.system;
  ColorSchemeType _scheme = ColorSchemeType.green;

  ThemeData _currentThemeData = greenLightTheme;

  ThemeNotifier(this._storageService) {
    _loadFromPreferences();
  }

  AppTheme get theme => _theme;
  ColorSchemeType get scheme => _scheme;
  ThemeData get currentThemeData => _currentThemeData;

  Future<void> setTheme(AppTheme theme) async {
    _theme = theme;
    await _saveToPreferences();
    _updateTheme();
    notifyListeners();
  }

  Future<void> setScheme(ColorSchemeType scheme) async {
    _scheme = scheme;
    await _saveToPreferences();
    _updateTheme();
    notifyListeners();
  }

  void _updateTheme() {
    switch (_theme) {
      case AppTheme.system:
        _currentThemeData = greenLightTheme;
      case AppTheme.light:
        switch (_scheme) {
          case ColorSchemeType.green:
            _currentThemeData = greenLightTheme;
          case ColorSchemeType.blue:
            _currentThemeData = blueLightTheme;
          case ColorSchemeType.orange:
            _currentThemeData = orangeLightTheme;
        }
      case AppTheme.dark:
        switch (_scheme) {
          case ColorSchemeType.green:
            _currentThemeData = greenDarkTheme;
          case ColorSchemeType.blue:
            _currentThemeData = blueDarkTheme;
          case ColorSchemeType.orange:
            _currentThemeData = orangeDarkTheme;
        }
    }
  }

  String textTitleTheme() {
    var title = '';
    if (_theme == AppTheme.system) {
      title = 'Системная';
    } else if (_theme == AppTheme.light) {
      title = 'Светлая';
    } else {
      title = 'Темная';
    }
    return title;
  }

  Future<void> _saveToPreferences() async {
    await _storageService.saveTheme(_theme.index);
    await _storageService.saveScheme(_scheme.index);
  }

  void _loadFromPreferences() {
    final themeIndex = _storageService.loadTheme();
    final schemeIndex = _storageService.loadScheme();
    _theme = AppTheme.values[themeIndex];
    _scheme = ColorSchemeType.values[schemeIndex];
    _updateTheme();
    notifyListeners();
  }
}

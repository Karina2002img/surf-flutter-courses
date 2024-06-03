import 'package:flutter/material.dart';
import 'package:new_task13/storage.dart';
import 'package:new_task13/theme.dart';

enum AppTheme { system, dark, light }
enum ColorSchemeType { green, blue, orange }

class ThemeNotifier extends ChangeNotifier {
  // final StorageService _storageService = StorageService();

  AppTheme _theme = AppTheme.system;
  ColorSchemeType _scheme = ColorSchemeType.green;

  ThemeData _currentThemeData = greenLightTheme;

  AppTheme get theme => _theme;
  ColorSchemeType get scheme => _scheme;
  ThemeData get currentThemeData => _currentThemeData;

  // ThemeNotifier() {
  //   Future.microtask(() => _loadFromPreferences());
  // }

  Future<void> setTheme(AppTheme theme) async {
    _theme = theme;
    // await _saveToPreferences();
    _updateTheme();
    notifyListeners();
  }

  Future<void> setScheme(ColorSchemeType scheme) async {
    _scheme = scheme;
    // await _saveToPreferences();
    _updateTheme();
    notifyListeners();
  }

  void _updateTheme() {
    switch (_theme) {
      case AppTheme.system:
        _currentThemeData = greenLightTheme;
        break;
      case AppTheme.light:
        switch (_scheme) {
          case ColorSchemeType.green:
            _currentThemeData = greenLightTheme;
            break;
          case ColorSchemeType.blue:
            _currentThemeData = blueLightTheme;
            break;
          case ColorSchemeType.orange:
            _currentThemeData = orangeLightTheme;
            break;
        }
        break;
      case AppTheme.dark:
        switch (_scheme) {
          case ColorSchemeType.green:
            _currentThemeData = greenDarkTheme;
            break;
          case ColorSchemeType.blue:
            _currentThemeData = blueDarkTheme;
            break;
          case ColorSchemeType.orange:
            _currentThemeData = orangeDarkTheme;
            break;
        }
        break;
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

  // Future<void> _saveToPreferences() async {
  //   await _storageService.saveTheme(_theme.index);
  //   await _storageService.saveScheme(_scheme.index);
  // }

  // Future<void> _loadFromPreferences() async {
  //   final themeIndex = await _storageService.loadTheme();
  //   final schemeIndex = await _storageService.loadScheme();
  //   _theme = AppTheme.values[themeIndex];
  //   _scheme = ColorSchemeType.values[schemeIndex];
  //   _updateTheme();
  //   notifyListeners();
  // }
}


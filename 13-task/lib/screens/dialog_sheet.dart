import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_task13/controller.dart';
import 'package:new_task13/components.dart';

class ModalBottomSheetDemo extends StatefulWidget {
  const ModalBottomSheetDemo({super.key});

  @override
  State<ModalBottomSheetDemo> createState() => _ModalBottomSheetDemoState();
}

class _ModalBottomSheetDemoState extends State<ModalBottomSheetDemo> {
  late AppTheme _selectedTheme;
  late ColorSchemeType _selectedScheme;
  late ColorSchemeType? _temporaryScheme;  // изменено на ColorSchemeType?

  @override
  void initState() {
    super.initState();
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _selectedTheme = themeNotifier.theme;
    _selectedScheme = themeNotifier.scheme;
    _temporaryScheme = _selectedScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            ),
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Тема оформления',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            RadioListTile<AppTheme>(
                              title: const Text('Системная'),
                              value: AppTheme.system,
                              groupValue: _selectedTheme,
                              onChanged: (AppTheme? value) {
                                setState(() {
                                  _selectedTheme = value!;
                                  _temporaryScheme = null;  // Сбросить цветовую схему
                                });
                              },
                            ),
                            RadioListTile<AppTheme>(
                              title: const Text('Светлая'),
                              value: AppTheme.light,
                              groupValue: _selectedTheme,
                              onChanged: (AppTheme? value) {
                                setState(() {
                                  _selectedTheme = value!;
                                  _temporaryScheme = null;  // Сбросить цветовую схему
                                });
                              },
                            ),
                            if (_selectedTheme == AppTheme.light)
                              ChoosingColorScheme(
                                selectedScheme: _temporaryScheme,
                                onSchemeSelected: (scheme) {
                                  setState(() {
                                    _temporaryScheme = scheme;
                                  });
                                },
                              ),
                            RadioListTile<AppTheme>(
                              title: const Text('Темная'),
                              value: AppTheme.dark,
                              groupValue: _selectedTheme,
                              onChanged: (AppTheme? value) {
                                setState(() {
                                  _selectedTheme = value!;
                                  _temporaryScheme = null;  // Сбросить цветовую схему
                                });
                              },
                            ),
                            if (_selectedTheme == AppTheme.dark)
                              ChoosingColorScheme(
                                selectedScheme: _temporaryScheme,
                                onSchemeSelected: (scheme) {
                                  setState(() {
                                    _temporaryScheme = scheme;
                                  });
                                },
                              ),
                            ElevatedButton(
                              onPressed: () {
                                Provider.of<ThemeNotifier>(context, listen: false).setTheme(_selectedTheme);
                                Provider.of<ThemeNotifier>(context, listen: false).setScheme(_temporaryScheme ?? _selectedScheme); // Установка схемы только если она выбрана
                                Navigator.of(context).pop();
                              },
                              child: const Text('Применить'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

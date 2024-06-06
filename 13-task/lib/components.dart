import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_task13/controller.dart';

class ChoosingColorScheme extends StatefulWidget {
  final ColorSchemeType? selectedScheme;  // изменено на ColorSchemeType?
  final Function(ColorSchemeType) onSchemeSelected;

  const ChoosingColorScheme({
    super.key,
    required this.selectedScheme,
    required this.onSchemeSelected,
  });

  @override
  State<ChoosingColorScheme> createState() => _ChoosingColorSchemeState();
}

class _ChoosingColorSchemeState extends State<ChoosingColorScheme> {
  late ColorSchemeType? _selectedScheme;  // изменено на ColorSchemeType?

  @override
  void initState() {
    super.initState();
    _selectedScheme = widget.selectedScheme;
  }

  Widget containerInRowColourScheme(
      String pathIcon,
      String? titleModalBottomSheetScheme,
      bool isPressed,
      Color fgColorContainerInModalBottomSheet,
      ) {
    return Container(
      height: 64,
      width: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: isPressed
            ? Border.all(
          color: fgColorContainerInModalBottomSheet,
          width: 2,
        )
            : null,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SvgPicture.asset(
              pathIcon,
              height: 24,
              width: 24,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(titleModalBottomSheetScheme ?? ""),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Цветовая схема'),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedScheme = ColorSchemeType.green;
                  });
                  widget.onSchemeSelected(_selectedScheme!); // ! для разрешения null
                },
                child: containerInRowColourScheme(
                  'assets/icons/1.svg',
                  'Схема 1',
                  _selectedScheme == ColorSchemeType.green,
                  Colors.greenAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedScheme = ColorSchemeType.blue;
                  });
                  widget.onSchemeSelected(_selectedScheme!); // ! для разрешения null
                },
                child: containerInRowColourScheme(
                  'assets/icons/2.svg',
                  'Схема 2',
                  _selectedScheme == ColorSchemeType.blue,
                  Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedScheme = ColorSchemeType.orange;
                  });
                  widget.onSchemeSelected(_selectedScheme!); // ! для разрешения null
                },
                child: containerInRowColourScheme(
                  'assets/icons/3.svg',
                  'Схема 3',
                  _selectedScheme == ColorSchemeType.orange,
                  Colors.orangeAccent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

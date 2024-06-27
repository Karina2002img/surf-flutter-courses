import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_task13/domain/controller.dart';
import 'package:new_task13/uikit/theme/theme.dart';
import 'package:new_task13/uikit/colors/appColors.dart';

/// Виджет в модальном окне для выбора цветовой схемы
class ChoosingColorScheme extends StatefulWidget {
  final ColorSchemeType? selectedScheme;
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
  late ColorSchemeType? _selectedScheme;

  @override
  void initState() {
    super.initState();
    _selectedScheme = widget.selectedScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 19, left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Цветовая схема',
            ),
          ),
        ),

        Row(
          children: [
            ColorSchemeOption(
              pathIcon: 'assets/icons/1.svg',
              title: 'Схема 1',
              isSelected: _selectedScheme == ColorSchemeType.green,
              borderColor: AppColors.colorAppBarDecorationGreen,
              onTap: () {
                setState(() {
                  _selectedScheme = ColorSchemeType.green;
                });
                widget.onSchemeSelected(_selectedScheme!);
              },
            ),
            ColorSchemeOption(
              pathIcon: 'assets/icons/2.svg',
              title: 'Схема 2',
              isSelected: _selectedScheme == ColorSchemeType.blue,
              borderColor: AppColors.colorAppBarDecorationBlue,
              onTap: () {
                setState(() {
                  _selectedScheme = ColorSchemeType.blue;
                });
                widget.onSchemeSelected(_selectedScheme!);
              },
            ),
            ColorSchemeOption(
              pathIcon: 'assets/icons/3.svg',
              title: 'Схема 3',
              isSelected: _selectedScheme == ColorSchemeType.orange,
              borderColor: AppColors.colorAppBarDecorationOrange,
              onTap: () {
                setState(() {
                  _selectedScheme = ColorSchemeType.orange;
                });
                widget.onSchemeSelected(_selectedScheme!);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ColorSchemeOption extends StatelessWidget {
  final String pathIcon;
  final String? title;
  final bool isSelected;
  final Color borderColor;
  final VoidCallback onTap;

  const ColorSchemeOption({super.key,
    required this.pathIcon,
    required this.title,
    required this.isSelected,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: ColorSchemeContainer(
          pathIcon: pathIcon,
          titleModalBottomSheetScheme: title,
          isPressed: isSelected,
          fgColorContainerInModalBottomSheet: borderColor,
        ),
      ),
    );
  }
}


/// Виджет с ячейкой выбора цветовой схемы
class ColorSchemeContainer extends StatelessWidget {
  final String pathIcon;
  final String? titleModalBottomSheetScheme;
  final bool isPressed;
  final Color fgColorContainerInModalBottomSheet;

  const ColorSchemeContainer({super.key,
    required this.pathIcon,
    required this.titleModalBottomSheetScheme,
    required this.isPressed,
    required this.fgColorContainerInModalBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 103,
      decoration: BoxDecoration(
        color: Theme.of(context).customContainerColor2,
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
}
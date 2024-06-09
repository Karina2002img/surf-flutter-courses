import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_task13/controller.dart';
import 'package:new_task13/theme.dart';
import 'package:new_task13/colorUI.dart';

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
                  widget.onSchemeSelected(_selectedScheme!);
                },
                child: containerInRowColourScheme(
                  'assets/icons/1.svg',
                  'Схема 1',
                  _selectedScheme == ColorSchemeType.green,
                  AppColors.colorAppBarDecorationGreen,
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
                  widget.onSchemeSelected(_selectedScheme!);
                },
                child: containerInRowColourScheme(
                  'assets/icons/2.svg',
                  'Схема 2',
                  _selectedScheme == ColorSchemeType.blue,
                  AppColors.colorAppBarDecorationBlue,
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
                  widget.onSchemeSelected(_selectedScheme!);
                },
                child: containerInRowColourScheme(
                  'assets/icons/3.svg',
                  'Схема 3',
                  _selectedScheme == ColorSchemeType.orange,
                  AppColors.colorAppBarDecorationOrange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class FormsContainer extends StatelessWidget {
  final String textForm;
  final String textMok;
  final Color? color;
  final Widget? trailingIcon;

  const FormsContainer({
    super.key,
    required this.textForm,
    required this.textMok,
    this.color,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 20, top: 10),
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          color: Theme.of(context).customContainerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textForm,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                    textMok,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            if (trailingIcon != null) trailingIcon!,
          ],
        ),
      ),
    );
  }
}

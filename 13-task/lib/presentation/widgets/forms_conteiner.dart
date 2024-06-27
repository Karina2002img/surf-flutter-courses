import 'package:flutter/material.dart';
import 'package:new_task13/uikit/theme/theme.dart';

/// Виджет ячейки формы

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
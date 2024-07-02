import 'package:flutter/material.dart';
import 'package:test_task16/presentation/widgets/custom_text_field.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onTapTextField;
  final TextEditingController? controllerTextField;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.text,
    this.onChanged,
    this.onTapTextField,
    this.controllerTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              side: WidgetStateBorderSide.resolveWith(
                    (states) => const BorderSide(width: 1.0, color: Colors.transparent),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.focused) ||
                    states.contains(WidgetState.selected) ||
                    states.contains(WidgetState.pressed)) {
                  return Theme.of(context).colorScheme.secondaryContainer;
                } else {
                  return Theme.of(context).colorScheme.primaryContainer;
                }
              }),
              checkColor: Theme.of(context).colorScheme.primaryContainer,
              value: value,
              onChanged: onChanged,
            ),
            Text(text),
          ],
        ),
        if (value == true)
          CustomTextField(
            labelText: 'Дата последней прививки',
            onTap: onTapTextField,
            controller: controllerTextField,
          ),
      ],
    );
  }
}

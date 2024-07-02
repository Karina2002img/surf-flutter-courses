import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> customCupertinoDatePicker({required BuildContext context}) {
  return showModalBottomSheet<DateTime>(
    context: context,
    builder: (BuildContext builder) {
      DateTime? selectedDate;
      return SizedBox(
        height: 250,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime date) {
                  selectedDate = date;
                },
              ),
            ),
            TextButton(
              child: const Text('Выбрать'),
              onPressed: () {
                Navigator.of(context).pop(selectedDate);
              },
            ),
          ],
        ),
      );
    },
  );
}


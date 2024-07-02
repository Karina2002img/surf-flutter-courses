import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task16/utils/custom_icons.dart';
import 'package:flutter/cupertino.dart';


enum Vaccine { rabies, covid, malaria }
enum Pet { dog, cat, parrot, hamster }

class RegistrationController {
  final ValueNotifier<Pet> petNotifier = ValueNotifier<Pet>(Pet.dog);
  final ValueNotifier<List<Vaccine>> checkboxNotifier = ValueNotifier<List<Vaccine>>([]);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final Map<Vaccine, TextEditingController> vaccineControllers = {
    Vaccine.rabies: TextEditingController(),
    Vaccine.covid: TextEditingController(),
    Vaccine.malaria: TextEditingController(),
  };
  bool isLoading = false;

  void dispose() {
    nameController.dispose();
    dateController.dispose();
    weightController.dispose();
    emailController.dispose();
    vaccineControllers.forEach((_, controller) {
      controller.dispose();
    });
  }

  Future<void> onDateTap(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await customCupertinoDatePicker(context: context);
    if (pickedDate != null) {
      controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
    }
  }

  void onPetChange(Pet pet) {
    petNotifier.value = pet;
    nameController.clear();
    dateController.clear();
    weightController.clear();
    emailController.clear();
    vaccineControllers.forEach((_, controller) {
      controller.clear();
    });
  }

  void onCheckboxChange(bool value, Vaccine vaccine) {
    if (value) {
      checkboxNotifier.value = List.from(checkboxNotifier.value)..add(vaccine);
    } else {
      checkboxNotifier.value = List.from(checkboxNotifier.value)..remove(vaccine);
    }
  }

  String getCheckboxText(Vaccine vaccine) {
    switch (vaccine) {
      case Vaccine.rabies:
        return 'бешенства';
      case Vaccine.covid:
        return 'коронавируса';
      case Vaccine.malaria:
        return 'малярии';
      default:
        return '';
    }
  }

  String getPetText(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return 'Собака';
      case Pet.cat:
        return 'Кошка';
      case Pet.parrot:
        return 'Попугай';
      case Pet.hamster:
        return 'Хомяк';
      default:
        return '';
    }
  }

  String getPetImage(Pet pet) {
    switch (pet) {
      case Pet.dog:
        return CustomIcons.iconDog;
      case Pet.cat:
        return CustomIcons.iconCat;
      case Pet.parrot:
        return CustomIcons.iconParrot;
      case Pet.hamster:
        return CustomIcons.iconHamster;
      default:
        return '';
    }
  }
}

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


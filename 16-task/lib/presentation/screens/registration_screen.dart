import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:test_task16/data/models/form_data.dart';
import 'package:test_task16/presentation/widgets/widgets.dart';
import 'package:test_task16/utils/validators.dart';
import 'package:test_task16/controller/registration_controller.dart';  // Импортируйте контроллер


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegistrationController _controller = RegistrationController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ValueListenableBuilder<Pet>(
            valueListenable: _controller.petNotifier,
            builder: (context, petValue, child) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        for (final pet in Pet.values)
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: CustomIcon(
                              image: _controller.getPetImage(pet),
                              onTap: () => _controller.onPetChange(pet),
                              isActive: petValue == pet,
                              text: _controller.getPetText(pet),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Имя питомца',
                      controller: _controller.nameController,
                      validator: nameValidate,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'День рождения питомца',
                      controller: _controller.dateController,
                      keyboardType: TextInputType.datetime,
                      onTap: () => _controller.onDateTap(context, _controller.dateController),
                      validator: dateValidate,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _controller.weightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: weightValidate,
                      labelText: 'Вес, кг',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _controller.emailController,
                      labelText: 'Почта хозяина',
                      validator: emailValidate,
                    ),
                    const SizedBox(height: 24),
                    if (petValue != Pet.hamster && petValue != Pet.parrot)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Сделаны прививки от:', style: Theme.of(context).textTheme.labelLarge),
                          ),
                          const SizedBox(height: 24),
                          for (final vaccine in Vaccine.values)
                            ValueListenableBuilder<List<Vaccine>>(
                              valueListenable: _controller.checkboxNotifier,
                              builder: (context, checkboxValue, child) {
                                return CustomCheckbox(
                                  text: _controller.getCheckboxText(vaccine),
                                  value: checkboxValue.contains(vaccine),
                                  onChanged: (value) => _controller.onCheckboxChange(value!, vaccine),
                                  onTapTextField: () => _controller.onDateTap(context, _controller.vaccineControllers[vaccine]!),
                                  controllerTextField: _controller.vaccineControllers[vaccine]!,
                                );
                              },
                            ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    CustomButton(
                      onPressed: () {
                        setState(() {
                          _controller.isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success')));
                        }
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            _controller.isLoading = false;
                          });
                        });
                        final FormData formData = FormData(
                          pet: petValue,
                          dateBirth: _controller.dateController.text,
                          email: _controller.emailController.text,
                          vaccines: _controller.checkboxNotifier.value,
                          name: _controller.nameController.text,
                          weight: int.parse(_controller.weightController.text),
                        );
                        print(formData);
                      },
                      isLoading: _controller.isLoading,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

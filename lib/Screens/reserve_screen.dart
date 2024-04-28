import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_date.dart';
import 'package:saiey/Screens/common/custom_input_dropdown.dart';
import 'package:saiey/models/sidebar.dart';

class AddReserveForm extends StatefulWidget {
  const AddReserveForm({super.key});

  @override
  State<AddReserveForm> createState() => __AddReserveFormState();
}

class __AddReserveFormState extends State<AddReserveForm> {
  final _addReserveFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Reservar Habitacion',
          actions: [],
        ),
        drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _addReserveFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                CustomInputDroopdown(
                  labelText: 'Seleccione el Tipo de Habitación Requerida:',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                  items: const [
                    DropdownMenuItem(
                      value: null,
                      child: Text('Presione aquí para seleccionar una opcion'),
                    ),
                    DropdownMenuItem(
                      value: 'Opción 1',
                      child: Text('Opción 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Opción 2',
                      child: Text('Opción 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Opción 3',
                      child: Text('Opción 3'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle dropdown value change
                  },
                ),

                const SizedBox(height: 16),
                CustomDateInputField(
                  labelText: 'Seleccione una Fecha de Inicio (dd/mm/yyyy)',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                CustomDateInputField(
                  labelText: 'Seleccione una Fecha de fin (dd/mm/yyyy)',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 22),
                CustomFormButton(innerText: 'Reservar', onPressed: _handleAddReserveForm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleAddReserveForm() {
    // signup user
    if (_addReserveFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

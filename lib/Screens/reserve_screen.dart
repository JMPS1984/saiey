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
  List<String> tiposHabitacion = ['Sencilla', 'Doble', 'Triple', 'Cuádruple'];
  Map<String, List<String>> habitacionesDisponibles = {
    'Sencilla': ['001', '002', '003', '004', '005', '006', '007', '008', '009', '010'],
    'Doble': ['011', '012', '013', '014', '015', '016', '017', '018', '019', '020'],
    'Triple': ['021', '022', '023', '024', '025', '026', '027', '028', '029', '030'],
    'Cuádruple': ['031', '032', '033', '034', '035', '036', '037', '038', '039', '040'],
  };
  String? selectedRoomType;
  String? selectedRoomNumber;

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
                  hintText: 'Presione aquí para seleccionar una opción',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                                        items: tiposHabitacion.map((String tipo) {
                                      return DropdownMenuItem(
                                        value: tipo,
                                        child: Text(tipo),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedRoomType = value;
                                        selectedRoomNumber = null;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                if (selectedRoomType != null)
                                  Column(
                                    children: [
                                      const Text(
                                        'Habitaciones disponibles para la categoría seleccionada',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: habitacionesDisponibles[selectedRoomType]!.map((number) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedRoomNumber = number;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                            decoration: BoxDecoration(
                                              color: selectedRoomNumber == number
                                                  ? Colors.blue
                                                  : Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              number,
                                              style: TextStyle(
                                                color: selectedRoomNumber == number
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
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
                           ]
                         ),
                        ),
                     ),
                    ),
                  );
                }

  void _handleAddReserveForm() {
    if (_addReserveFormKey.currentState!.validate() && selectedRoomNumber != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

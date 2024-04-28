import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_dropdown.dart';
import 'package:saiey/Screens/common/custom_number_field.dart';
import 'package:saiey/models/sidebar.dart';

class AddRoomForm extends StatefulWidget {
  const AddRoomForm({super.key});

  @override
  State<AddRoomForm> createState() => __AddRoomFormState();
}

class __AddRoomFormState extends State<AddRoomForm> {

  File? _roomImage;


  final _addRoomFormKey = GlobalKey<FormState>();

  Future _pickRoomtImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _roomImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('ha ocurrido un error al cargar la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Agregar Habitacion:', actions: [], 
        ),
        drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _addRoomFormKey,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _roomImage != null ? FileImage(_roomImage!) : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: _pickRoomtImage,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      border: Border.all(color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      if (MediaQuery.of(context).size.width < 600)
                        Column(
                          children: [
                              const SizedBox(height: 16),
                CustomInputDroopdown(
                  labelText: 'Seleccione el Tipo de Habitación:',
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
                            
                           CustomNumberField(
                              labelText: 'Número de Habitación',
                              hintText: 'Número',
                              isDense: true,
                              validator: (textValue) {
                                if (textValue == null || textValue.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),


                          ],
                        )
                     else
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                    const SizedBox(height: 16),
                CustomInputDroopdown(
                  labelText: 'Seleccione el Tipo de Habitación:',
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
                CustomNumberField(
                labelText: 'Número de Habitación',
                hintText: 'Número',
                isDense: true,
                 validator: (textValue) {
                 if (textValue == null || textValue.isEmpty) {
                                  return 'Este campo es requerido';
                                }
                                return null;
                              },
                            ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                
                Container(
                
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomFormButton(innerText: 'Agregar', onPressed: _handleAddRoomForm),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleAddRoomForm() {
    // signup user
    if (_addRoomFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}
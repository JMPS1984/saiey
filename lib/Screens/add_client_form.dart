import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/models/sidebar.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => __AddClientScreenState();
}

class __AddClientScreenState extends State<AddClientScreen> {

  File? _clientImage;


  final _addClientFormKey = GlobalKey<FormState>();

  Future _pickClientImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _clientImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('ha ocurrido un error al cargar la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Registrar Cliente:', actions: [], 
        ),
        drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _addClientFormKey,
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
                          backgroundImage: _clientImage != null ? FileImage(_clientImage!) : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: _pickClientImage,
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
                        CustomInputField(
                          labelText: 'Nombre',
                          hintText: 'Nombre',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                          labelText: 'Apellido',
                          hintText: 'Apellido',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                          labelText:
                              'Introduzca su dirección de Correo Electrónico',
                          hintText: 'ejemplo@gmail.com',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            if (!EmailValidator.validate(textValue)) {
                              return 'introduzca un correo válido';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                          labelText: 'Teléfono:',
                          hintText: 'ejemplo: 041612345678',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                    
                      const SizedBox(
                        height: 22,
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
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  labelText: 'Cédula',
                  hintText: 'Cédula',
                  isDense: true,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'este campo es requerido!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre',
                  isDense: true,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'este campo es requerido!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido',
                  isDense: true,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'este campo es requerido!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  labelText: 'Introduzca su dirección de Correo Electrónico',
                  hintText: 'ejemplo@gmail.com',
                  isDense: true,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'este campo es requerido!';
                    }
                    if (!EmailValidator.validate(textValue)) {
                      return 'introduzca un correo válido';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomInputField(
                  labelText: 'Teléfono:',
                  hintText: 'ejemplo: 041612345678',
                  isDense: true,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'este campo es requerido!';
                    }
                    return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                         Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomInputField(
                                      labelText: 'Nueva Contraseña',
                                      hintText: 'contraseña',
                                      isDense: true,
                                      obscureText: true,
                                      validator: (textValue) {
                                        if (textValue == null || textValue.isEmpty) {
                                          return 'este campo es requerido!';
                                        }
                                        return null;
                                      },
                                      suffixIcon: true,
                                    ),
                                    const SizedBox(height: 16),
                                    CustomInputField(
                                      labelText: 'Confirmar Contraseña',
                                      hintText: 'Confirmar Contraseña',
                                      isDense: true,
                                      obscureText: true,
                                      validator: (textValue) {
                                        if (textValue == null || textValue.isEmpty) {
                                          return 'este campo es requerido!';
                                        }
                                        return null;
                                      },
                                      suffixIcon: true,
                                    ),
                                    const SizedBox(height: 22),
                                  ],
                                ),
                              ),
                            ],
                          ),
                                      
                                      Container(
                                      
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        child: CustomFormButton(innerText: 'Agregar', onPressed: _handleAddClientForm),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              ),
                            ),
                            ),
                          ),
                          );
                        }

  void _handleAddClientForm() {
    // signup user
    if (_addClientFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}
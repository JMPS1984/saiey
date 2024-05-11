import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/Screens/common/page_header.dart';
import 'package:saiey/Screens/common/page_heading.dart';
import 'package:saiey/Utilities/routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  File? _profileImage;

  final _signupFormKey = GlobalKey<FormState>();

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('ha ocurrido un error al cargar la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const PageHeader(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(title: 'Registrar',),
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: _pickProfileImage,
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
                                  const SizedBox(height: 20,),
                                CustomFormButton(innerText: 'Registrar', onPressed: _handleAddClientForm,),
                                const SizedBox(height: 18,),
                                SizedBox(
  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Ya tiene una cuenta? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () => {
                                           Navigator.pushNamed(context, MyRoutes.loginScreen),
                                        },
                                        child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                      ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      ),
                                    ),
                                    
                                    ]
                                  ),
                                  ),
                                ),
                                ),
                                );
                        }

  void _handleAddClientForm() {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

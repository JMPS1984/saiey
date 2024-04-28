import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/models/sidebar.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => __EditProfileScreenState();
}

class __EditProfileScreenState extends State<EditProfileScreen> {

  File? _profileImage;

  final _editProfileFormKey = GlobalKey<FormState>();

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
         appBar: const MyAppBar(
        title: 'Editar Perfil', actions: [], // Cambiado a String en lugar de Text
      ),
      drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _editProfileFormKey,
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
                      const SizedBox(height: 16,),
                       CustomInputField(
                          labelText: 'Editar Cédula',
                          hintText: 'Editar Cédula',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                      CustomInputField(
                          labelText: 'Editar Nombre',
                          hintText: 'Editar Nombre',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                                            const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Editar Apellido',
                          hintText: 'Editar Apellido',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Introduzca su dirección de Correo Electrónico',
                          hintText: 'ejemplo@gmail.com',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            if(!EmailValidator.validate(textValue)) {
                              return 'introduzca un correo válido';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Teléfono:',
                          hintText: 'ejemplo: 041612345678',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                        labelText: 'Nueva Contraseña',
                        hintText: 'contraseña',
                        isDense: true,
                        obscureText: true,
                        validator: (textValue) {
                          if(textValue == null || textValue.isEmpty) {
                            return 'este campo es requerido!';
                          }
                          return null;
                          
                        },
                        suffixIcon: true,
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                        labelText: 'Confirmar Contraseña',
                        hintText: 'Confirmar Contraseña',
                        isDense: true,
                        obscureText: true,
                        validator: (textValue) {
                          if(textValue == null || textValue.isEmpty) {
                            return 'este campo es requerido!';
                          }
                          return null;
                          
                        },

                        suffixIcon: true,
                      ),

                      const SizedBox(height: 22,),
                      CustomFormButton(innerText: 'Actualizar', onPressed: _handleEditProfileUser,),
                      
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

  void _handleEditProfileUser() {
    // signup user
    if (_editProfileFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

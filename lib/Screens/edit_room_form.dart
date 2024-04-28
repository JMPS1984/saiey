import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/models/sidebar.dart';


class EditRoomForm extends StatefulWidget {
  const EditRoomForm({super.key});

  @override
  State<EditRoomForm> createState() => __EditRoomFormState();
}

class __EditRoomFormState extends State<EditRoomForm> {

  File? _roomImage;

  final _editRoomFormKey = GlobalKey<FormState>();

  Future _pickProductImage() async {
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
        title: 'Modificar Habitacion:', actions: [], 
      ),
      drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _editRoomFormKey,
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
                                  onTap: _pickProductImage,
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
                          labelText: 'Tipo',
                          hintText: 'tipo',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                      CustomInputField(
                          labelText: 'Número',
                          hintText: 'Número',
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
                          labelText: 'Presentación',
                          hintText: 'Presentación',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                          
                      ),

                      CustomInputField(
                          labelText: 'Precio de Alquiler',
                          hintText: '0,00',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                          
                      ),
                                        

                      const SizedBox(height: 22,),
                      CustomFormButton(innerText: 'Actualizar', onPressed: _handleEditRoomForm),
                      
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

  void _handleEditRoomForm() {
    // signup user
    if (_editRoomFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

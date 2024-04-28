import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/models/sidebar.dart';


class EditTypeRoomForm extends StatefulWidget {
  const EditTypeRoomForm({super.key});

  @override
  State<EditTypeRoomForm> createState() => __EditTypeRoomFormState();
}

class __EditTypeRoomFormState extends State<EditTypeRoomForm> {

 final _editTypeRoomFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: const MyAppBar(
        title: 'Editar Tipo de Habitación', actions: [], // Cambiado a String en lugar de Text
      ),
      drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _editTypeRoomFormKey,
            child: Column(
              children: [   
                      const SizedBox(height: 16,),
                       CustomInputField(
                          labelText: 'Tipo de Habitación',
                          hintText: 'Sencilla, doble, triple, otra',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'este campo es requerido!';
                            }
                            return null;
                          }
                      ),
                      CustomInputField(
                          labelText: 'Capacidad',
                          hintText: '',
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
                      CustomFormButton(innerText: 'Actualizar', onPressed: _handleEditTypeRoomForm,),
                      
                    ],
                  ),
                ),
        ),
      ),


            );

  }

  void _handleEditTypeRoomForm() {
    // signup user
    if (_editTypeRoomFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

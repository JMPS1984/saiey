import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/models/sidebar.dart';

class AddTypeRoomForm extends StatefulWidget {
  const AddTypeRoomForm({super.key});

  @override
  State<AddTypeRoomForm> createState() => __AddTypeRoomFormState();
}

class __AddTypeRoomFormState extends State<AddTypeRoomForm> {
  final _addTypeRoomFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'Agregar un Tipo de Habitación',
          actions: [],
        ),
        drawer: const SideBar(),
        backgroundColor: const Color(0xffEEF1F3),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildDesktopView(context);
            } else {
              return _buildMobileView(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Form(
          key: _addTypeRoomFormKey,
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomInputField(
                labelText: 'Tipo de Habitación',
                hintText: 'Sencilla, doble, triple, otra',
                isDense: true,
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'este campo es requerido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomInputField(
                labelText: 'Capacidad',
                hintText: '',
                isDense: true,
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'este campo es requerido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomInputField(
                labelText: 'Precio de Alquiler por Noche',
                hintText: '0,00',
                isDense: true,
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'este campo es requerido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              Center(
                child: CustomFormButton(
                  innerText: 'Crear',
                  onPressed: _handleAddTypeRoomForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addTypeRoomFormKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Tipo de Habitación',
              hintText: 'Sencilla, doble, triple, otra',
              isDense: true,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'este campo es requerido!';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Capacidad',
              hintText: '',
              isDense: true,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'este campo es requerido!';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomInputField(
              labelText: 'Precio de Alquiler por Noche',
              hintText: '0,00',
              isDense: true,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'este campo es requerido!';
                }
                return null;
              },
            ),
            const SizedBox(height: 22),
            CustomFormButton(
              innerText: 'Crear',
              onPressed: _handleAddTypeRoomForm,
            ),
          ],
        ),
      ),
    );
  }

  void _handleAddTypeRoomForm() {
    if (_addTypeRoomFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('procesando datos..')),
      );
    }
  }
}

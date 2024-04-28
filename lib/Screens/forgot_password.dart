import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/Screens/common/page_header.dart';
import 'package:saiey/Screens/common/page_heading.dart';
import 'package:saiey/Utilities/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword ({super.key});

  @override
  State<ForgotPassword > createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword > {
  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double forgotPasswordWidth = size.width * 0.35;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Desktop layout
              return Column(
                children: [
                  const PageHeader(),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: forgotPasswordWidth,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _forgotPasswordFormKey,
                            child: Column(
                              children: [
                                const PageHeading(title: 'Recuperar Contraseña',),
                                CustomInputField(
                                  labelText: 'Ingrese su direccion de Correo Electrónico',
                                  hintText: 'ejemplo@gmail.com',
                                  validator: (textValue) {
                                    if(textValue == null || textValue.isEmpty) {
                                      return 'Este campo es requerido!';
                                    }
                                    if(!EmailValidator.validate(textValue)) {
                                      return 'Introduzca un correo válido';
                                    }
                                    return null;
                                  }
                                ),
                            
                                const SizedBox(height: 36,),
                                Container(
                                  
                            width: size.width * 0.80,
                            alignment: Alignment.centerRight,
                           
                              child: const Text(
                                'Se le enviará un Link de Recuperación a su correo Electrónico',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 171, 236),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                                const SizedBox(height: 20,),
                                CustomFormButton(innerText: 'Enviar', onPressed: _handleForgotPasswordUser,),
                                const SizedBox(height: 18,),
                                SizedBox(
                                  width: size.width * 0.8,
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
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // Mobile layout
              return Column(
                children: [
                  const PageHeader(),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _forgotPasswordFormKey,
                            child: Column(
                              children: [
                                const PageHeading(title: 'Recuperar Contraseña',),
                                CustomInputField(
                                  labelText: 'Ingrese su direccion de Correo Electrónico',
                                  hintText: 'ejemplo@gmail.com',
                                  validator: (textValue) {
                                    if(textValue == null || textValue.isEmpty) {
                                      return 'Este campo es requerido!';
                                    }
                                    if(!EmailValidator.validate(textValue)) {
                                      return 'Introduzca un correo válido';
                                    }
                                    return null;
                                  }
                                ),
                              const SizedBox(height: 16,),
                                 Container(
                            width: size.width * 0.80,
                            alignment: Alignment.centerRight,
                           
                              child: const Text(
                                'Se le enviará un Link de Recuperación a su correo Electrónico',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 171, 236),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                                const SizedBox(height: 20,),
                                CustomFormButton(innerText: 'Enviar', onPressed: _handleForgotPasswordUser,),
                                const SizedBox(height: 18,),
                                SizedBox(
                                  width: size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Ya tiene una cuenta? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () => {
                                           Navigator.pushNamed(context, MyRoutes.loginScreen),
                                        },
                                        child: const Text('Inicia Sesión', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                      ),
                                       const SizedBox(height: 30,),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _handleForgotPasswordUser() {
    // ForgotPassword user
    if (_forgotPasswordFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Procesando datos..')),
      );
    }
  }
}
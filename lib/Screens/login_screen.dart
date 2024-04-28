import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/custom_form_button.dart';
import 'package:saiey/Screens/common/custom_input_field.dart';
import 'package:saiey/Screens/common/page_header.dart';
import 'package:saiey/Screens/common/page_heading.dart';
import 'package:saiey/Utilities/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double loginWidth = size.width * 0.35;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 170, 241),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // vista de pc
              return Column(
                children: [
                  const PageHeader(),
                  Expanded(
                    
                    child: Center(
                      child: Container(
                        
                        width: loginWidth,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                const PageHeading(title: 'Iniciar Sesión',),
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
                                CustomInputField(
                                  labelText: 'Contraseña',
                                  hintText: 'contraseña',
                                  obscureText: true,
                                  suffixIcon: true,
                                  validator: (textValue) {
                                    if(textValue == null || textValue.isEmpty) {
                                      return 'este campo es requerido!';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16,),
                                Container(
                            width: size.width * 0.80,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.pushNamed(context, MyRoutes.forgotPassword),
                              },
                              child: const Text(
                                'Olvidó su Contraseña?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 171, 236),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                                const SizedBox(height: 20,),
                                CustomFormButton(innerText: 'Entrar', onPressed: _handleLoginUser,),
                                const SizedBox(height: 18,),
                                SizedBox(
                                  width: size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('No tiene una cuenta? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () => {
                                           Navigator.pushNamed(context, MyRoutes.signUp),
                                        },
                                        child: const Text('Registrar', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text('esta linea es solo para probar el ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(context, MyRoutes.homeScreen),
                                  },
                                  child: const Text('HOME', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
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
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                const PageHeading(title: 'Iniciar Sesión',),
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
                                CustomInputField(
                                  labelText: 'Contraseña',
                                  hintText: 'contraseña',
                                  obscureText: true,
                                  suffixIcon: true,
                                  validator: (textValue) {
                                    if(textValue == null || textValue.isEmpty) {
                                      return 'este campo es requerido!';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16,),
                                Container(
                                  width: size.width * 0.80,
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.pushNamed(context, MyRoutes.forgotPassword),
                                    },
                                    child: const Text(
                                      'Olvidó su Contraseña?',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 59, 171, 236),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                CustomFormButton(innerText: 'Entrar', onPressed: _handleLoginUser,),
                                const SizedBox(height: 18,),
                                SizedBox(
                                  width: size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('No tiene una cuenta? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () => {
                                           Navigator.pushNamed(context, MyRoutes.signUp),
                                        },
                                        child: const Text('Registrar', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                const Text('esta linea es solo para probar el ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(context, MyRoutes.homeScreen),
                                  },
                                  child: const Text('HOME', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
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

  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Procesando datos..')),
      );
    }
  }
}
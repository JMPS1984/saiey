import 'package:flutter/material.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/models/sidebar.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      drawer: const SideBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/users/default.jpg'),
              radius: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Nombre: Usuario',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Apellido: Apellido',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Correo Electrónico: usuario@example.com',
              style: TextStyle(fontSize: 20),
            ),
              const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed(MyRoutes.editProfile);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Fondo azul
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Letras blancas
                  ),
                  child: const Text('Editar Perfil'),
                ),
                const SizedBox(width: 20), // Espacio entre los botones
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Eliminar Perfil'),
                          content: const Text('¿Estás seguro que quieres eliminar éste perfil?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Code to delete profile goes here
                                Navigator.of(context).pop();
                              },
                              child: const Text('Eliminar Perfil'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Fondo rojo
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Letras blancas
                  ),
                  child: const Text('Eliminar Perfil'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

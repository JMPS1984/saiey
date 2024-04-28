import 'package:flutter/material.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/constaints.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title, required List<Tooltip> actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primary[500],
      title: Text(title),
      actions: [
        Tooltip(
          message: 'Salir',
          child: IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('¿Estás seguro de que deseas salir?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(MyRoutes.loginScreen);
                      },
                      child: const Text('Sí'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


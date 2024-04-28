import 'package:flutter/material.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/constaints.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Nombre del Usuario'),
            accountEmail: const Text('usuario@example.com'),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.userProfile);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/users/user_profile_image.jpeg'),
              ),
            ),
            decoration: const BoxDecoration(
               color: primary,
            ),
          ),
        ListTile(
           leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeScreen);
            },
          ),
        ListTile(
           leading: const Icon(Icons.people),
            title: const Text('Clientes'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.listClientsPage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_border_sharp),
            title: const Text('Tipo de Habitación'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.typeRoomScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bed),
            title: const Text('Habitaciones'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.roomListScreen);
            },
          ),
             ListTile(
            leading: const Icon(Icons.bookmark_add),
            title: const Text('Reservas'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.addReserveScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Ingresos'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.typeRoomScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.money_off),
            title: const Text('Egresos'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.typeRoomScreen);
            },
          ),
        ]
      )
    );
} 
}
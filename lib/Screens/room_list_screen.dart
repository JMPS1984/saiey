// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/models/sidebar.dart';

class Room {
  final String number;
  final String image;
  final String type;
  final String status;

  Room(this.number, this.image, this.type, this.status);
}

class RoomListScreen extends StatelessWidget {
  final List<Room> _rooms = [
    Room('01', 'assets/products/01.jpeg', 'SENCILLA', 'DISPONIBLE'),
    Room('02', 'assets/products/02.jpeg', 'DOBLE MATRIMONIAL', 'OCUPADA'),
    Room('03', 'assets/products/03.jpeg', 'TRIPLE', 'DISPONIBLE'),
    Room('04', 'assets/products/04.jpeg', 'CUADRUPLE', 'DISPONIBLE'),
  ];

  RoomListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Habitaciones',
        actions: [],
      ),
      drawer: const SideBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildDesktopView(context);
          } else {
            return _buildMobileView(context);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 116, 170, 214),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.addRoomForm);
          // Puedes abrir un formulario para agregar un nuevo Roome
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return ListView.builder(
      itemCount: _rooms.length,
      itemBuilder: (context, index) {
        final room = _rooms[index];
        return _buildRoomList(context, room.number, room.image, room.type, room.status);
      },
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Número')),
          const DataColumn(label: Text('Imagen')),
          const DataColumn(label: Text('Tipo')),
          const DataColumn(label: Text('Estado')),
          const DataColumn(label: Text('Acciones')),
        ],
        rows: _rooms.map((room) {
          return DataRow(cells: [
            DataCell(Text(room.number)),
            DataCell(
              FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  room.image,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            DataCell(Text(room.type)),
            DataCell(Text(room.status)),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed(MyRoutes.editRoomForm);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text('Editar'),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Eliminar'),
                            content: const Text('¿Estás seguro que quieres eliminar esta Habitación?'),
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
                                child: const Text('Eliminar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Text('Eliminar'),
                  ),
                ],
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _buildRoomList(BuildContext context, String number, String image, String type, String status) {
    return ListTile(
      leading: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset(
          image,
          width: 70,
          height: 70,
        ),
      ),
      title: Text('Número: $number'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('TIPO: $type'),
          Text('ESTADO: $status'),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(MyRoutes.editRoomForm);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Editar'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Eliminar'),
                        content: const Text('¿Estás seguro que quieres eliminar esta Habitación?'),
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
                            child: const Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Eliminar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

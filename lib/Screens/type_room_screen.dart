import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/models/sidebar.dart';

class TypeRoomScreen extends StatelessWidget {
  const TypeRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Tipo de Habitaciones',
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
          Navigator.pushNamed(context, MyRoutes.addTypeRoomForm);
          // Puedes abrir un formulario para agregar un nuevo Room
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Tipo')),
          DataColumn(label: Text('Capacidad')),
          DataColumn(label: Text('Precio')),
          DataColumn(label: Text('Acciones')),
        ],
        rows: _roomTypes.map((roomType) {
          return DataRow(cells: [
            DataCell(Text(roomType.name)),
            DataCell(Text(roomType.capacity)),
            DataCell(Text('\$${roomType.price}')),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Lógica para editar el tipo de habitación
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
                      // Lógica para eliminar el tipo de habitación
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

  Widget _buildMobileView(BuildContext context) {
    return ListView(
      children: _roomTypes.map((roomType) {
        return _buildTypeRoom(context, roomType.name, roomType.capacity, roomType.price);
      }).toList(),
    );
  }

  Widget _buildTypeRoom(BuildContext context, String name, String capacity, double price) {
    return ListTile(
      title: Text('Tipo: $name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Capacidad: $capacity'),
          Text('Precio: \$$price'),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(MyRoutes.editTypeRoomForm);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Fondo azul
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Letras blancas
                ),
                child: const Text('Editar'),
              ),
              const SizedBox(width: 20), // Espacio entre los botones
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Eliminar'),
                        content: const Text('¿Estás seguro que quieres eliminar este tipo de habitación?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Code to delete type room goes here
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Fondo rojo
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Letras blancas
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

class RoomType {
  final String name;
  final String capacity;
  final double price;

  RoomType(this.name, this.capacity, this.price);
}

final List<RoomType> _roomTypes = [
  RoomType('SENCILLA', 'UN (01) OCUPANTE', 38.9),
  RoomType('DOBLE MATRIMONIAL', 'DOS (02) OCUPANTES', 52.69),
  RoomType('TRIPLE', 'TRES (03) OCUPANTES', 84.16),
  RoomType('CUADRUPLE', 'CUATRO (04) OCUPANTES', 104.22),
];

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/models/sidebar.dart';

class ClientList {
    final String cedula;
    final String image;
    final String lastName;
    final String clientName;
    final String telefono;
    final String accountEmail;
    final String clientsDate;
    final String lastVisitDate;

  ClientList(this.cedula, this.image, this.lastName, this.clientName, this.telefono, this.accountEmail, this.clientsDate, this.lastVisitDate);
}

class ListClientsPage extends StatelessWidget {
  final List<ClientList> _clients = [
    ClientList('25422365', 'assets/users/default.jpg', 'OVIEDO CASTRO', 'JOSE ANTONIO', '04142355665', 'oviedojose@gmail.com', '01/03/2024', '01/03/2024'),
    ClientList('19544875', 'assets/users/default.jpg', 'CASTILLO SANCHEZ', 'OLLIE JAVIER', '04123255454', 'castiolli@gmail.com', '15/02/2024', '15/02/2024'),
    ClientList('22155455', 'assets/users/default.jpg', 'PEREZ GUEVARA', 'MARIA EUGENIA', '04263566645', 'perezmar@gmail.com', '10/04/2024', '10/04/2024'),
    ClientList('17544844', 'assets/users/default.jpg', 'TORO CLISANCHEZ', 'MAIKEL RAMON', '04241515665', 'torobravo16@gmail.com', '05/05/2024', '05/04/2024'),
  ];

  ListClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Lista de Clientes',
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
          Navigator.pushNamed(context, MyRoutes.addClientScreen);
          // Puedes abrir un formulario para agregar un nuevo ClientListe
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return ListView.builder(
      itemCount: _clients.length,
      itemBuilder: (context, index) {
        final clientList = _clients[index];
        return _buildClientListList(context, clientList.cedula, clientList.image, clientList.lastName, clientList.clientName, clientList.telefono, clientList.accountEmail, clientList.clientsDate, clientList.lastVisitDate);
      },
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return Center(
      child: DataTable(
         columnSpacing: 16, // Espacio entre columnas
        columns: [
          const DataColumn(label: Text('Cedula')), 
          const DataColumn(label: Text('Foto')),
          const DataColumn(label: Text('Apellidos')),
          const DataColumn(label: Text('Nombres')),
          const DataColumn(label: Text('Teléfono')),
          const DataColumn(label: Text('correo')),
          const DataColumn(label: Text('Cliente desde')),
          const DataColumn(label: Text('Última Visita')),
          const DataColumn(label: Text('Acciones')),
        ],
        rows: _clients.map((clientList) {
          return DataRow(cells: [
            DataCell(Text(clientList.cedula)),
            DataCell(
              FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  clientList.image,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            DataCell(Text(clientList.lastName)),
            DataCell(Text(clientList.clientName)),
            DataCell(Text(clientList.telefono)),
            DataCell(Text(clientList.accountEmail)),
            DataCell(Text(clientList.clientsDate)),
            DataCell(Text(clientList.lastVisitDate)),
            
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed(MyRoutes.editProfile);
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
                            content: const Text('¿Está seguro que desea eliminar éste perfil?'),
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

  Widget _buildClientListList(BuildContext context, String cedula, String image, String lastName, String clientName, String telefono, String accountEmail, String clientsDate, String lastVisitDate) {
    return ListTile(
      leading: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset(
          image,
          width: 70,
          height: 70,
        ),
      ),
      title: Text('Cédula: $cedula'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Apellidos: $lastName'),
          Text('Nombres: $clientName'),
          Text('Telefono: $telefono'),
          Text('Correo Electrónico: $accountEmail'),
          Text('Cliente desde: $clientsDate'),
          Text('Última Visita: $lastVisitDate'),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(MyRoutes.editProfile);
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
                        content: const Text('¿Está seguro que desea eliminar éste perfil?'),
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

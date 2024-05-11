import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/models/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Inicio',
        actions: [], // Cambiado a String en lugar de Text
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
    );
  }

  Widget _buildDesktopView(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Color(0xff4FC3F7),
            child: SizedBox(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Item 1'),
                subtitle: Text('Descripción del Item 1'),
              ),
            ),
          ),
          SizedBox(width: 16),
          Card(
            color: Color(0xff29B6F6),
            child: SizedBox(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.event),
                title: Text('Item 2'),
                subtitle: Text('Descripción del Item 2'),
              ),
            ),
          ),
          SizedBox(width: 16),
          Card(
            color: Color(0xff2196F3),
            child: SizedBox(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.barcode_reader),
                title: Text('Item 3'),
                subtitle: Text('Descripción del Item 3'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return const Column(
      children: [
        Card(
          color: Color(0xff4FC3F7),
          child: ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Item 1'),
            subtitle: Text('Descripción del Item 1'),
          ),
        ),
        SizedBox(height: 16),
        Card(
          color: Color(0xff29B6F6),
          child: ListTile(
            leading: Icon(Icons.event),
            title: Text('Item 2'),
            subtitle: Text('Descripción del Item 2'),
          ),
        ),
        SizedBox(height: 16),
        Card(
          color: Color(0xff2196F3),
          child: ListTile(
            leading: Icon(Icons.barcode_reader),
            title: Text('Item 3'),
            subtitle: Text('Descripción del Item 3'),
          ),
        ),
      ],
    );
  }
}


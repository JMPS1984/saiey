import 'package:flutter/material.dart';
import 'package:saiey/Screens/common/app_bar.dart';
import 'package:saiey/models/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Inicio',
        actions: [], // Cambiado a String en lugar de Text
      ),
      drawer: const SideBar(),
      body: Center(
        child: Container(
          width: size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Color(0xff4FC3F7),
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Item 1'),
                  subtitle: Text('Descripción del Item 1'),
                ),
              ),
              Card(
                color: Color(0xff29B6F6),
                child: ListTile(
                  leading: Icon(Icons.event),
                  title: Text('Item 2'),
                  subtitle: Text('Descripción del Item 2'),
                ),
              ),
              Card(
                color: Color(0xff2196F3),
                child: ListTile(
                  leading: Icon(Icons.barcode_reader),
                  title: Text('Item 3'),
                  subtitle: Text('Descripción del Item 3'),
                ),
            
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:saiey/Screens/add_room_form.dart';
import 'package:saiey/Screens/add_type_room.dart';
import 'package:saiey/Screens/add_client_form.dart';
import 'package:saiey/Screens/edit_profile_screen.dart';
import 'package:saiey/Screens/edit_room_form.dart';
import 'package:saiey/Screens/edit_type_room_form.dart';
import 'package:saiey/Screens/forgot_password.dart';
import 'package:saiey/Screens/home_screen.dart';
import 'package:saiey/Screens/list_clients.dart';
import 'package:saiey/Screens/login_screen.dart';
import 'package:saiey/Screens/reserve_screen.dart';
import 'package:saiey/Screens/room_list_screen.dart';
import 'package:saiey/Screens/signup.dart';
import 'package:saiey/Screens/type_room_screen.dart';
import 'package:saiey/Screens/user_profile_screen.dart';
import 'package:saiey/Utilities/routes.dart';
import 'package:saiey/constaints.dart';





void main() => runApp(const Saiey());

class Saiey extends StatelessWidget {
  const Saiey({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel SAIEY',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => const HomeScreen(),
        MyRoutes.loginScreen: (context) => const LoginScreen(),
        MyRoutes.signUp: (context) => const Signup(),
        MyRoutes.forgotPassword: (context) => const ForgotPassword(),
        MyRoutes.userProfile: (context) => const UserProfile(),
        MyRoutes.editProfile:(context) =>  const EditProfileScreen(),
        MyRoutes.roomListScreen:(context) =>  RoomListScreen(),       
        MyRoutes.typeRoomScreen:(context) =>  const TypeRoomScreen(),
        MyRoutes.addTypeRoomForm:(context) =>  const AddTypeRoomForm(),
        MyRoutes.addRoomForm:(context) =>  const AddRoomForm(),
        MyRoutes.editRoomForm:(context) =>  const EditRoomForm(),
        MyRoutes.editTypeRoomForm:(context) =>  const EditTypeRoomForm(),
        MyRoutes.listClientsPage:(context) =>  ListClientsPage(),
        MyRoutes.addClientScreen:(context) =>  const AddClientScreen(),
        MyRoutes.addReserveScreen:(context) =>  const AddReserveForm(),

      },
    );
  }
}

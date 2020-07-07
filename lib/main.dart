import 'package:flutter/material.dart';
import 'package:rolefind/screens/JobsScreen.dart';
import 'package:rolefind/screens/login_screen.dart';
import 'package:rolefind/screens/registrationscreen.dart';
import 'package:rolefind/screens/JobsScreen.dart';


void main() {
  runApp(Rolefind());
}

class Rolefind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange[800],
        accentColor: Colors.deepOrangeAccent[600],
        textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),),

      initialRoute: LoginScreen.id,
    routes: {
    LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id:(context) => RegistrationScreen(),
      JobScreen.id :(context)=> JobScreen(),
  },
    );
  }
  }

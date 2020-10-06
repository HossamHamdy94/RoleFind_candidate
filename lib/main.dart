import 'package:flutter/material.dart';
import 'package:rolefind/Models/ui.dart';
import 'package:rolefind/screens/JobsScreen.dart';
import 'package:rolefind/screens/Jobscreen.dart';
import 'package:rolefind/screens/login_screen.dart';
import 'package:rolefind/screens/registrationscreen.dart';
import 'package:rolefind/screens/JobsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Rolefind());
}

class Rolefind extends StatelessWidget {
  String route ;
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
      RecentChats.id : (context) => RecentChats(),
      JobCard.id : (context) => JobCard()
  },
    );
  }
  }
Future<bool> showLoginPage() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  String stringValue = sharedPreferences.getString('useToken');
if (stringValue == null) {
  return true ;
}
else {return false; }

}

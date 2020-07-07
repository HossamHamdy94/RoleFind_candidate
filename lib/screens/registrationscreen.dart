import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rolefind/compenents/constants.dart';
import 'package:rolefind/compenents/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'package:rolefind/compenents/user_model.dart';
import 'package:rolefind/screens/login_screen.dart';

import 'Jobs.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

bool validatePassword(String value) {
  if (value != null) {
    if (value.length < 7)
      return false;
    else
      return true;
  } else
    return false;
}

bool validateEmail(String value) {
  if (value != null) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  } else {
    return false;
  }
}

Future<UserModel> createUser(
    String name, String email, String industry, String password) async {
  final String apiUrl = "https://api.rolefind.com/api/v0.6.1/user-auth/create";
  final response = await http.post(apiUrl, body: {
    "name": name,
    "email": email,
    "title": industry,
    "password": password,
  });

  print(response.body);
  if (response.statusCode == 201) {
    print(response.body);
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  UserModel _user;

  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (validateEmail(value)) email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register As Candidate',
                colour: Colors.deepOrange,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  if (!validateEmail(email)) {
                    print(validateEmail(email));
                    showSpinner = false;
                    FlutterToast.showToast(
                        msg: "Plz Enter Valid Email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (!validatePassword(password)) {
                    showSpinner = false;
                    FlutterToast.showToast(
                        msg:
                            "password must be longer than or equal to 6 characters",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    print(validateEmail(email).toString());
                    try {
                      final UserModel newUser =
                          await createUser("hossam", email, "dev", password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, JobsScreen.id);
                      }
                      setState(() {
                        _user = newUser;
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

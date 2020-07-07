import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rolefind/compenents/constants.dart';
import 'package:rolefind/compenents/rounded_button.dart';
import 'package:rolefind/compenents/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:rolefind/screens/Jobs.dart';
import 'package:rolefind/screens/registrationscreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<UserModel> login(String email, String password) async {
  final String apiUrl = "https://api.rolefind.com/api/v0.6.1/user-auth/login";
  dynamic response = await http.post(apiUrl, body: {
    "email": email,
    "password": password,
  });
  final String res = response.body;
  final JsonDecoder _decoder = new JsonDecoder();
  dynamic decoded = _decoder.convert(res);
  if (response.statusCode == 201) {
    print(response);

    print(decoded["user"]["email"]);
    return userModelFromJson(res);
  } else {
    throw new Exception(decoded["errorCode"]);
    print(response.body);
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;

  //final _auth = FirebaseAuth.instance;
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
                  email = value;
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
                title: 'Log In As Candidate',
                colour: Colors.deepOrangeAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    UserModel user = await login(email, password);
                    if (user != null) {
                      Navigator.pushNamed(context, JobsScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    FlutterToast.showToast(
                        msg: "User not Found",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });

                  }
                },
              ),
              RoundedButton(
                  title: "Create Account As Candidate",
                  colour: Colors.white30,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

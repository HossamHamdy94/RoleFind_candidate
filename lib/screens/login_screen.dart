import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rolefind/api/API.dart';
import 'package:rolefind/compenents/constants.dart';
import 'package:rolefind/compenents/rounded_button.dart';
import 'package:rolefind/screens/JobsScreen.dart';
import 'package:rolefind/screens/registrationscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;

  addStringToSF(String tokenvalue) async  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenkey', tokenvalue);
  }
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
                    var user = await API.login(email, password);
                    print ("hosssssam" + user.tokens.accessToken.toString());
                    if (user != null) {

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('useToken', user.tokens.accessToken);
                      ;

                      Navigator.pushReplacementNamed(context, JobScreen.id);

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

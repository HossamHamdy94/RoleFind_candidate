import 'package:flutter/material.dart';
import 'login_screen.dart';




class JobScreen extends StatefulWidget {
  static const String id = 'JobsScreen';

  @override
  _JobScreen createState() => _JobScreen();
}
class _JobScreen extends State <JobScreen> {

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[

          Expanded(
            child: Center(
              child: Text('Wellcome.....'),
            ),
          ),
        ],
      ),
    );
  }
}



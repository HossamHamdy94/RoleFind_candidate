import 'package:flutter/material.dart';
import 'login_screen.dart';


class JobsScreen extends StatelessWidget {
  static const String id = 'JobsScreen';

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



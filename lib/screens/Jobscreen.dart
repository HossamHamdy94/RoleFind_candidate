
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  static const String id = "job" ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CircularProgressIndicator(backgroundColor: Colors.orange,)),
//      child: new ListView.builder(
//          itemCount: tripsList.length,
//          itemBuilder: (BuildContext context, int index) =>
//              buildTripCard(context, index)),
    );
  }

}
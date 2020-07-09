import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rolefind/api/API.dart';
import 'package:rolefind/screens/JobsScreen.dart';
import 'package:rolefind/screens/login_screen.dart';

class RecentChats extends StatelessWidget {
  static const String id = 'ui';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: API.getAllJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              print("hossssssssssssssssssssssssam"+snapshot.data[5].client.name
              );
              return SafeArea(
                child: Container(
                  width: double.infinity,
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                                  builder: (_) => JobScreen(),
                              ),
                        ),
                        child: Container(

                          margin: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, right: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                CircleAvatar(
                          backgroundColor: Colors.transparent,
                                  child:
                                  Image.network("${snapshot.data[i].client.avatar}"),
                                  radius: 30.0,

                                ),
                         //       SizedBox(width: 5.0),
                                Container(

                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[i].title,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          new DateFormat.yMMMd()
                                              .format(snapshot.data[i].createdAt)
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Column(children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 12,
                                                      child:
                                                          Icon(Icons.access_time),
                                                    ),
                                                    Text(
                                                      snapshot.data[i].duration
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                //    SizedBox(height: 20.0),
                                                SizedBox(height: 5.0),
                                                Row(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 12,
                                                      child:
                                                          Icon(Icons.location_on),
                                                    ),
                                                    Text(
                                                      snapshot.data[i].duration
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                              SizedBox(width: 5.0),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          radius: 15,
                                                          child: Icon(
                                                              Icons.access_time),
                                                        ),
                                                        Text(
                                                          snapshot.data[i].budget
                                                                  .toString() +
                                                              "/" +
                                                              snapshot.data[i]
                                                                  .paymentSchedule
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          radius: 12,
                                                          child: Icon(
                                                              Icons.location_on),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data[i].industry,
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.0,

                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ]),
                                              SizedBox(width: 5.0),
                                            ])
                                      ]),
                                )
                              ]),
//                              Container(
//                                child: Row(
//                                  children: <Widget>[
//                                    Column(children: <Widget>[
//                                      Text(
//                                        snapshot.data[i].title,
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 15.0,
//                                        ),
//                                      ),
//                                      Text(
//                                        "2020/30/1",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 15.0,
//                                        ),
//                                      ),
//                                    ]),
//                                  ],
//                                ),
//                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              SafeArea(child: Text('Sorry there is an error'));
            }

            return SafeArea(child: CircularProgressIndicator());
          }),
    );
  }
}

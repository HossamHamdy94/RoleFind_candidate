import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rolefind/Models/JobModel.dart';
import 'package:rolefind/api/API.dart';
import 'package:rolefind/screens/Jobscreen.dart';
import 'package:rolefind/screens/login_screen.dart';

class JobScreen extends StatefulWidget {
  static const String id = 'JobScreen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<JobScreen> {
  Future<List<Job>> Jobs;

//  @override
//  void initState() {
//    super.initState();
//    Jobs = API.getAllJobs();
//    setState(() {
//
//    }); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
//      appBar: AppBar(
//        title: Text('Jobs'),
//      ),
      body: SafeArea(
        child: FutureBuilder<List<Job>>(
          future: API.getAllJobs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var Location ;
              return Container(

                // width: double.infinity,
                child: ListView.builder(

                    padding: new EdgeInsets.all(5.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {


                      //   var date = DateTime.fromMillisecondsSinceEpoch(ms);
                      //    var formattedDate = DateFormat.yMMMd().format(date).toString();

                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => JobCard(),
                          ),
                        ),
                        child: Card( color: Colors.transparent,
                          child: Container(
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            color: Colors.white12,
                                borderRadius: BorderRadius.circular(30.0)
                        ),
                            width: double.infinity,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    snapshot.data[i].client
                                        .avatar), // no matter how big it is, it won't overflow
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data[i].title,
                                  ),
                                  Text(
                                      new DateFormat.yMMMd()
                                          .format(snapshot.data[i].createdAt)),

                                ],
                              ),
                              subtitle: Column( mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconWithlabel(icon1: Icon(Icons.access_time),label1:snapshot.data[i].duration.toString(),icon2: Icon(Icons.attach_money),label2:snapshot.data[i].budget.toString()),
                                  IconWithlabel(icon1: Icon(Icons.location_on),label1: snapshot.data[i].location is String ?
                                  snapshot.data[i].location.toString(): snapshot.data[i].location["city"].toString()+ ", \n"+snapshot.data[i].location["country"].toString()   ,icon2:
                                  Icon(Icons.comment),label2:snapshot.data[i].industry),


                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              Text('Sorry there is an error');
            }
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.orange,));
          },
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.orange,
//        child: Icon(Icons.add),
//        onPressed: () async {
//          setState(() {
//            API.getAllJobs();
//          });
//        },
//      ),
    );
  }
}

class IconWithlabel extends StatelessWidget {
  IconWithlabel({this.icon1, this.label1, this.icon2, this.label2});

  Icon icon1;
  Icon icon2;

  String label1;
  String label2;

  @override
  Widget build(BuildContext context) {
    return Row(
//      crossAxisAlignment: CrossAxisAlignment.baseline,
//      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,

                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius:10,
                    child: icon1,
                    // no matter how big it is, it won't overflow
                  ),
                ),
              ),
              Flexible(child: Text(label1,  style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              )))],
          ),
        ),

        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 10,
                child: icon2,
                // no matter how big it is, it won't overflow
              ),
              Flexible(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label2
                ,  style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ), ),
              )), ],

          ),
        ),

      ],
    );
  }
}

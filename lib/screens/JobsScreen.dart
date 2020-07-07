import 'package:flutter/material.dart';
import 'package:rolefind/Models/JobModel.dart';
import 'package:rolefind/api/API.dart';
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
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: FutureBuilder<List<Job>>(

        future:API.getAllJobs(),
        builder: (context,snapshot)
        {
       if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              child: ListView.builder(
                  padding: new EdgeInsets.all(0.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Container(
                        width: double.infinity,
                        child: ListTile(
                          title: Text(snapshot.data[i].title),
                          subtitle: Row(
                            children:

                            <Widget>[
                              Text(snapshot.data[i].industry),
                              SizedBox(
                                width: 100,
                              ),
                              Text(snapshot.data[i].budget.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
       }
          else   {
            Text('Sorry there is an error');
          }
          return CircularProgressIndicator() ;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          setState(() {
            API.getAllJobs();
          });
        },
      ),
    );
  }
}

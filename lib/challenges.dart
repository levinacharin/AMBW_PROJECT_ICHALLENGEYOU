import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:time_change_detector/time_change_detector.dart';
import 'dbservices.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

import 'definit.dart';

double _healthScore = 0;

class challenges extends StatefulWidget {
  final String idchallenge;
  final String emaill;

  const challenges({Key? key, required this.idchallenge, required this.emaill})
      : super(key: key);

  @override
  State<challenges> createState() => _challengesState();
}

class _challengesState extends State<challenges>with WidgetsBindingObserver{
  Stream<bool>? _controller;
  String _message = EVENT_MESSAGE_DEFAULT;

  late StreamSubscription _subscription;

  DateTime currentDate = DateTime.now();
  String statusText = 'no reset';
  
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  int _jumlah = 0;
//@override
  Stream<QuerySnapshot<Object?>> listchallengeuser() {
    setState(() {});
    // if(currentDate.day!=widget.idchallenge){
    //   Database.ubahstatusallnotyet(widget.emaill);
    // }
    return Database.getlistchallenge(
        //widget.emaill, widget.idchallenge.toString());
        widget.emaill, widget.idchallenge);
  }

  Widget alarmlay(BuildContext context, String desc_challenge) {
    TextEditingController hourController = TextEditingController();
    TextEditingController minuteController = TextEditingController();
    return new AlertDialog(
      title: Text('Alarm ' + desc_challenge),
      content: new Column(children: <Widget>[
        //SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 59, 219, 255),
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: TextField(
                  controller: hourController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 59, 219, 255),
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: TextField(
                  controller: minuteController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: TextButton(
            child: const Text(
              'Create alarm',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              int hour;
              int minutes;
              hour = int.parse(hourController.text);
              minutes = int.parse(minuteController.text);
              FlutterAlarmClock.createAlarm(hour, minutes,
                  title: desc_challenge);
              //Navigator.of(context).pop();
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // show alarm
            FlutterAlarmClock.showAlarms();
          },
          child: const Text(
            'Show Alarms',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ]),
      actions: <Widget>[
        new ElevatedButton(
          //ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _popupChallenge(BuildContext context, String deschallenge,
      String statuschallenge, String namadocumentchallenge) {
    return new AlertDialog(
      title: Text('$deschallenge'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  alarmlay(context, deschallenge)));
                    },
                    icon: Icon(Icons.alarm, color: Colors.red),
                    iconSize: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Set Alarm',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (statuschallenge != "done") {
                        Database.ubahData(widget.emaill, namadocumentchallenge);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You Finished $deschallenge'),
                          ),
                        );
                      }
                      _healthScore += 0.2;
                      Database.ubahDataHealthScore(widget.emaill,
                          namadocumentchallenge, _healthScore.toString());
                      // print(_healthScore);
                      Navigator.of(context).pop();
                      // else{
                      //   Database.ubahData('levinacharin7@gmail.com',namadocumentchallenge);
                      // }
                    },
                    icon: Icon(Icons.check_circle, color: Colors.green),
                    iconSize: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green)),
                ],
              )
            ],
          )
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          //ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I Challenge You",
      home: Scaffold(
        body: Container(
            decoration: new BoxDecoration(color: Colors.orange[50]),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // decoration: new BoxDecoration(
                    //   color: Colors.orange[50]
                    // ),
                    child: const Text(
                      "I Challenge You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  decoration: new BoxDecoration(color: Colors.orange[100]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('User')
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Map<String?, dynamic> data =
                                snapshot.data!.data() as Map<String?, dynamic>;
                            return Column(
                              children: [
                                Icon(Icons.account_circle),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${data['username']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Text('Loading...');
                          }
                        },
                      ),
                      Column(
                        children: [
                          const Text(
                            "Health Status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: listchallengeuser(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('ERROR');
                              } else if (snapshot.hasData ||
                                  snapshot.data != null) {
                                return LinearPercentIndicator(
                                  // animation: true,
                                  // animationDuration: 1000,
                                  lineHeight: 15,
                                  width: 150,
                                  percent: _healthScore,
                                  center: Text('${_healthScore * 100}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  barRadius: const Radius.circular(16),
                                  progressColor: Colors.green,
                                  backgroundColor: Colors.green.shade100,
                                );
                              }

                              return Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.pinkAccent,
                                )),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: listchallengeuser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('ERROR');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              DocumentSnapshot dsData =
                                  snapshot.data!.docs[index];
                              //mengambil data per index ke dalam variabel data
                              String c_descchallenge = dsData['challengedesc'];
                              String c_status = dsData['status'];
                              String c_img = dsData['imgchallenge'].toString();
                              String c_namadoc =
                                  dsData['namadocument'].toString();
                              _jumlah = snapshot.data!.docs.length;
                              var coloricon = Colors.red;
                              int stat = 0xf616;
                              if (c_status == "done") {
                                stat = 0xf635;
                                coloricon = Colors.green;
                                // _healthScore += 0.2;
                              }

                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(
                                        color: Colors.grey.withOpacity(0.2),
                                        width: 1)),
                                elevation: 5,
                                child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/$c_img.jpg"),
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _popupChallenge(
                                                context,
                                                c_descchallenge,
                                                c_status,
                                                c_namadoc),
                                      );
                                    },
                                    title: Text(c_descchallenge),
                                    trailing: Icon(
                                        IconData(stat,
                                            fontFamily: 'MaterialIcons'),
                                        color: coloricon)),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10.0,
                                ),
                            itemCount: snapshot.data!.docs.length);
                      }
                      return Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pinkAccent,
                        )),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

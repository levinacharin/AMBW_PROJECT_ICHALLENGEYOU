import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichallengeyouapp/dbservices.dart';
import 'package:ichallengeyouapp/notifservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ichallengeyouapp/edit_profiledart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  late final LocalNotificationServices service;

  @override
  void initState() {
    // TODO: implement initState
    service = LocalNotificationServices();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    return Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(50, 5, 50, 5),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("FULL Name   : ",
                                  style: TextStyle(fontSize: 20)),
                              Text("Birthdate   : ",
                                  style: TextStyle(fontSize: 20)),
                              Text("Phonenumber : ",
                                  style: TextStyle(fontSize: 20)),
                              Text("Username    : ",
                                  style: TextStyle(fontSize: 20))
                            ],
                          ),
                          Column(
                            children: [
                              Text("${data['fullname']}",
                                  style: TextStyle(fontSize: 20)),
                              Text("${data['birthdate']}",
                                  style: TextStyle(fontSize: 20)),
                              Text("${data['phonenumber]']}",
                                  style: TextStyle(fontSize: 20)),
                              Text("${data['username']}",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    await service.showNotification(
                        id: 0,
                        title: 'Notification Title',
                        body: 'NotificationB Body');
                  },
                  child: Text("Show Notifikasi")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileUserEdit()),
            );
          },
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}

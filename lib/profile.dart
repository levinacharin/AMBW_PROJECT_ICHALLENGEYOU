import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichallengeyouapp/dbservices.dart';
import 'package:ichallengeyouapp/notifservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                    return Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${data['fullname']}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
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
      ),
    );
  }
}

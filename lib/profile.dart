import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichallengeyouapp/LoginMenu.dart';
import 'package:ichallengeyouapp/dbservices.dart';
import 'package:ichallengeyouapp/notifservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ichallengeyouapp/edit_profile.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  late final LocalNotificationServices service;

  int  _randomindex = 0;
  String? idquotesnotif;
  String? valuequotesnotif;

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
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.orange[50],
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
                    return Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 5),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text("I Challenge You", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Wrap(
                            children: [
                              Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    elevation: 10,
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text("Full Name        : ",
                                                  style: TextStyle(fontSize: 20)),
                                              SizedBox(height: 10,),
                                              Text("Birthdate          : ",
                                                  style: TextStyle(fontSize: 20)),
                                              SizedBox(height: 10,),
                                              Text("Phonenumber : ",
                                                  style: TextStyle(fontSize: 20)),
                                              SizedBox(height: 10,),
                                              Text("Username        : ",
                                                  style: TextStyle(fontSize: 20))
                                            ],
                                          ),
                                          const SizedBox(width: 5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${data['fullname']}",
                                                  style: TextStyle(fontSize: 20)),
                                              const SizedBox(height: 10,),
                                              Text("${data['birthdate']}",
                                                  style: TextStyle(fontSize: 20)),
                                              const SizedBox(height: 10,),
                                              Text("${data['phonenumber]']}",
                                                  style: TextStyle(fontSize: 20)),
                                              const SizedBox(height: 10,),
                                              Text("${data['username']}",
                                                  style: TextStyle(fontSize: 20)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
              
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const[
                    Text("Notification Quotes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    // FutureBuilder<DocumentSnapshot>(
                    //   future: 
                    //     FirebaseFirestore.instance
                    //       .collection('Quotes')
                    //       .get()
                    //       .then((value) {
                    //         value.docs.forEach((element) {
                              
                    //         });
                    //       }),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       Map<String?, dynamic> data =
                    //           snapshot.data!.data() as Map<String?, dynamic>;
                    //       return Container(
                    //         padding: EdgeInsets.fromLTRB(16, 16, 16, 5),
                    //         width: double.infinity,
                    //         child: Column(
                    //           children: [
                              
                    //           ],
                    //         ),
                    //       );
                    //     } else {
                    //       return Text('Loading...');
                    //     }
                    //   },
                    // ),
                    ElevatedButton(
                      onPressed: () async {
                        randomIndexQuotes();
                        // StreamBuilder<QuerySnapshot>(
                        //   stream: searchQuotes(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasError) {
                        //       return Text("ERROR");
                        //     } else if (snapshot.hasData || snapshot.data != null) {
                        //       DocumentSnapshot dQuotes = snapshot.data!.docs[_randomindex+1];
                        //       idquotesnotif = dQuotes['idQuotes'];
                        //       valuequotesnotif = dQuotes['value'];
                        //     }
                        //     return const Center(
                        //         child: CircularProgressIndicator(
                        //             valueColor: AlwaysStoppedAnimation<Color>(
                        //           Colors.pinkAccent,
                        //         )),
                        //       );
                        //   },
                        // );
                        await service.showDailyNotification(
                          id: 0,
                          title: 'I Challenge You',
                          body: "body"
                        );
                      },
                      child: Text("Show Notifikasi")),
                  ],
                ),
              ],
            ),
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
  
  void randomIndexQuotes() {
    Random randomquotes = Random();
    _randomindex = randomquotes.nextInt(4);
  }
  
  Stream<QuerySnapshot<Object?>> searchQuotes() {
    setState(() {
      
    });
    return Database.getlistquotes((_randomindex+1).toString());
  }
}



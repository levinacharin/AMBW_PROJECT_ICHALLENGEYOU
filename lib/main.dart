import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/LoginMenu.dart';
import 'package:ichallengeyouapp/bmi.dart';
import 'package:ichallengeyouapp/challenges.dart';
import 'package:ichallengeyouapp/login.dart';
import 'package:ichallengeyouapp/profile.dart';
import 'dbservices.dart';
import 'firebase_options.dart';
import 'package:time_change_detector/time_change_detector.dart';
import 'package:ichallengeyouapp/definit.dart';

int idchallengeygdigunakan = 1;
String idstring = idchallengeygdigunakan.toString();
final FirebaseAuth auth = FirebaseAuth.instance;
final String uid = auth.currentUser!.uid.toString();
//late int idchallengeygdigunakan = 2;

Future<void> main() async {
  //ubahstatusallnotyet(auth.currentUser!.email);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "ICHALLENGEYOU",
    home: LoginMenu(),
  ));
}

class MyApp extends StatefulWidget {
  //final int email;
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Stream<bool>? _controller;
  String _message = EVENT_MESSAGE_DEFAULT;

  late StreamSubscription _subscription;

  DateTime currentDate = DateTime.now();
  String statusText = 'no reset';

  // Future<String> idcelens() async {
  //   int idchallengeygdigunakan = 1;
  //   String idstring = idchallengeygdigunakan.toString();
  //   DateTime datenow = new DateTime.now();
  //   int selisih = 0;
  //   String llogin = await getLastLogin();
  //   selisih = int.parse(llogin) - int.parse(datenow.day.toString());
  //   if (selisih != 0) {
  //     idstring = datenow.day.toString();
  //   }
  //   return idstring;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print(currentDate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && Platform.isAndroid ||
        state == AppLifecycleState.paused && Platform.isAndroid ||
        state == AppLifecycleState.detached && Platform.isAndroid) {
      //_initWatcher();
    }
  }

  int currentIndex = 1;
  // String ehm = idcelens();
  // final screens = [
  //   bmi(),
  //   challenges(
  //       idchallenge: "1", emaill: auth.currentUser!.email.toString()),
  //   profiles()
  // ];
  // @override
  Widget build(BuildContext context) {
    final screens = [
      bmi(),
      challenges(
          idchallenge: currentDate.day.toString(),
          emaill: auth.currentUser!.email.toString()),
      profiles()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("I Challenge You"),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Challengess',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

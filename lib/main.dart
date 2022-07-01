import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/LoginMenu.dart';
import 'package:ichallengeyouapp/bmi.dart';
import 'package:ichallengeyouapp/challenges.dart';
import 'package:ichallengeyouapp/profile.dart';
import 'firebase_options.dart';
import 'package:time_change_detector/time_change_detector.dart';
import 'package:ichallengeyouapp/definit.dart';

int idchallengeygdigunakan = Random().nextInt(1) + 1;
final FirebaseAuth auth = FirebaseAuth.instance;
final String uid = auth.currentUser!.uid.toString();
//late int idchallengeygdigunakan = 2;

Future<void> main() async {
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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  Stream<bool>? _controller;
  String _message = EVENT_MESSAGE_DEFAULT;

  late StreamSubscription _subscription;

  DateTime currentDate = DateTime.now();
  String statusText = 'no reset';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
      _initWatcher();
    }
  }

  _initWatcher() {
    _controller ??= TimeChangeDetector.init;
    print(_message);
    _subscription = _controller!.listen((event) {
      setState(() => _message = '$EVENT_MESSAGE_SUCCESS: ${DateTime.now()}');
      print(_message);
    },
      onError: (error) => print('$ERROR: $error'),
      onDone: () => print(STREAM_COMPLETE));

    // CONDITIONAL DETECT GANTI HARI
    if (currentDate.hour == 00) {
      statusText = "reset";
    }

    if (currentDate.hour == 00 && currentDate.minute >= 01) {
      statusText = "no reset";
    }
  }

  int currentIndex = 1;
  final screens = [
    bmi(),
    challenges(
        idchallenge: idchallengeygdigunakan,
        emaill: auth.currentUser!.email.toString()),
    profiles()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ICHALLENGEYOU"),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
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
          ),
        ],
      ),
    );
  }
}

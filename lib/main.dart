import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/LoginMenu.dart';
import 'package:ichallengeyouapp/bmi.dart';
import 'package:ichallengeyouapp/challenges.dart';
<<<<<<< Updated upstream
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ichallengeyouapp/login.dart';
// import 'package:ichallengeyouapp/firebase_options.dart';
>>>>>>> Stashed changes
import 'package:ichallengeyouapp/profile.dart';
import 'firebase_options.dart';

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

class _MyAppState extends State<MyApp> {
  
  int currentIndex = 1;
  final screens = [bmi(), challenges(idchallenge: idchallengeygdigunakan, emaill: auth.currentUser!.email.toString()), profiles()];

 
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

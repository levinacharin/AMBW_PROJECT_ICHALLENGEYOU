import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ichallengeyouapp/main.dart';
import 'package:ichallengeyouapp/register.dart';
import 'package:ichallengeyouapp/register_profile.dart';
import 'package:ichallengeyouapp/dbservices.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 207, 102, 16),
        ),
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Text(
                  "I CHALLENGE YOU",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = Color.fromARGB(255, 238, 235, 233)),
                ),
                Text(
                  "I CHALLENGE YOU",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 199, 117, 50),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(

                controller: EmailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 199, 117, 50),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                controller: PasswordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 199, 117, 50),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: EmailController.text,
                  password: PasswordController.text)
              .then((user) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          }).catchError((e) {
            print(e);
          });
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Color.fromARGB(255, 199, 117, 50),
      ),
    );
  }
}

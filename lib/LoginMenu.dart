import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/register_profile.dart';
import 'login.dart';
import 'register.dart';

class LoginMenu extends StatefulWidget {
  const LoginMenu({Key? key}) : super(key: key);

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Menu",
      home: Container(
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(""),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text("Register"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

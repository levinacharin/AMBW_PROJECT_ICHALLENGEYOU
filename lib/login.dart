import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Challenge You",
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Challenge You"),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(145, 50, 145, 50),
                    decoration: new BoxDecoration(
                      color: Colors.orange[50]
                    ),
                    child: Text("LOGIN",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username:"),
                              TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    border: OutlineInputBorder(),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password:"),
                              TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange[50],
                                    border: OutlineInputBorder(),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Text("Forgot Password")),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: ElevatedButton(onPressed:(){}, child: Text("Login")))
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
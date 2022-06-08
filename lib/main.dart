import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Challenge You",
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Challenge You"),
        ),
        body: Container(
          
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.calculate, color: Colors.blue,),
                //title: new Text("BMI",)
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.assignment),
                //title: new Text("Challenges")
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle),
                //title: new Text("Profile")
            ),
            
                
          ],
        ),
      ),
    );
  }
}

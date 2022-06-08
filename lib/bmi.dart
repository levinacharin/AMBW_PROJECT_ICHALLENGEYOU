import 'package:flutter/material.dart';
class bmi extends StatefulWidget {
  const bmi({ Key? key }) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Challenge You",
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Challenge You"),
        ),
        body: Container(
          child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(133, 50, 133, 50),
                    decoration: new BoxDecoration(
                      color: Colors.orange[50]
                    ),
                    child: Text("I Challenge You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("BMI CALCULATOR")),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.person),
                            Icon(Icons.person)
                          ],),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(children: [
                          Text("Input Your Age:"),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[350],
                              border: OutlineInputBorder(),
                            ),
                          )
                          ],),)
                        ,
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(children: [
                          Text("Input Your Height (cm):"),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[350],
                              border: OutlineInputBorder(),
                            ),
                          )
                          ],),)
                        ,
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(children: [
                          Text("Input Your Weight (kg):"),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[350],
                              border: OutlineInputBorder(),
                            ),
                          )
                          ],),)
                        ,
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("SUBMIT"))
                ],
              )
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
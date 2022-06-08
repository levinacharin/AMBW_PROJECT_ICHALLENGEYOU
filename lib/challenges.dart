import 'package:flutter/material.dart';

class challenges extends StatefulWidget {
  const challenges({ Key? key }) : super(key: key);

  @override
  State<challenges> createState() => _challengesState();
}

class _challengesState extends State<challenges> {
  final List bulan = ["Jan", "Feb","Maret", "April", "Mei", "Juni", "Juli","Agus","Sept","Okt","Nov", "Des"];

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
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: new BoxDecoration(
                      color: Colors.orange[100]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.account_circle),
                            Text("orsafioree10")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Health Status"),
                            Row(children: [

                            ],),
                            Text("Happiness"),
                            Row(children: [

                            ],)
                            
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bulan.length,
                      itemBuilder: ((context,index){
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                          children: [
                            Text(bulan[index], style: TextStyle(fontSize: 30),),


                          ],
                        ));
                      }),
                    )
                  )
                  
                ],
              )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.calculate, color:Colors.black),
                //title: new Text("BMI",)
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.assignment, color: Colors.blue,),
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
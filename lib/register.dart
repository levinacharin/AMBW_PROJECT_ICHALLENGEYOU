import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({ Key? key }) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
                    padding: EdgeInsets.fromLTRB(112, 50, 112, 50),
                    decoration: new BoxDecoration(
                      color: Colors.orange[50]
                    ),
                    child: Text("REGISTER",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Full Name:"), 
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Birthdate:"),
                                    Text("160401") //diganti tanggal,
                                    
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Gender:"),
                                  
                                  Text("Female") //diganti dropdown
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone Number:"),
                              //Text("089934278472874")
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email:"),
                              //Text("rosafioree@email.com")
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username:"),
                              //Text("rosafioree10")
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password:"),
                              //Text("buattextfield")
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Confirmation Password:"),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: 
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check_box_outline_blank),
                          Text("I have agree with the term of conditions")
                        ],
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Register"))
                      
                    ],),
                  )
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dataclass.dart';
import 'dbservices.dart';

class challenges extends StatefulWidget {
  
  const challenges({ Key? key }) : super(key: key);

  @override
  State<challenges> createState() => _challengesState();
}

class _challengesState extends State<challenges> {
  int _jumlah = 0;

  Stream<QuerySnapshot<Object?>> listchallengeuser(){
    setState(() {
      
    });
    return Database.getlistchallenge('levinacharin7@gmail.com');
  }
  

  // Stream<QuerySnapshot<Object?>> detaillistchallenge(){
  //   setState(() {
      
  //   });
  //   return Database.getdetailchallenge('levinacharin7@gmail.com');
  // }
  // Stream<QuerySnapshot<Object?>> txtsearch = Database.getlistchallenge('levinacharin7@gmail.com');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I Challenge You",
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("I Challenge You"),
        // ),
        body: Container(
          decoration: new BoxDecoration(
                      color: Colors.orange[50]
                    ),
          child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                    // decoration: new BoxDecoration(
                    //   color: Colors.orange[50]
                    // ),
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
                            Text("rosafioree10")
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
                  SizedBox(height: 20,),
                  Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: listchallengeuser(),
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('ERROR');
                              }else if(snapshot.hasData || snapshot.data != null){
                                return ListView.separated(
                                  itemBuilder: (context, index){
                                    DocumentSnapshot dsData = snapshot.data!.docs[index];
                                    //mengambil data per index ke dalam variabel data
                                    String c_descchallenge = dsData['challengedesc'];
                                    String c_status = dsData['status'];
                                    String c_img = dsData['imgchallenge'].toString();
                                    _jumlah = snapshot.data!.docs.length;
                                    var coloricon = Colors.red;
                                    int stat = 0xf616;
                                    if(c_status == "done"){
                                      stat = 0xf635;
                                      coloricon = Colors.green;
                                    }
                                    
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        side: BorderSide(color: Colors.grey.withOpacity(0.2),
                                        width: 1)
                                      ),
                                      elevation: 5,
                                      
                                      child: ListTile(
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius: BorderRadius.circular(15),
                                        //   elevation
                                        //   side: BorderSide(color: Colors.black)
                                        // ),
                                        leading: CircleAvatar(
                                          backgroundImage:NetworkImage("assets/images/\$c_img.jpg"),
                                        ),
                                        title: Text(c_descchallenge),
                                        //subtitle: Text(c_status),
                                        trailing: Icon(IconData(stat, fontFamily: 'MaterialIcons'),
                                        color: coloricon)
                                        
                                      ),
                                    );
                                  }, 
                                  separatorBuilder: (context, index) => const SizedBox(height: 10.0,), 
                                  itemCount: snapshot.data!.docs.length
                                  );
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.pinkAccent,
                                    
                                  )),
                              );
                            },
                          ),
                        ),

                  
                ],
              )
        ),
       
      ),
    );
  }
}
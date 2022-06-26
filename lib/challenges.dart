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

  Stream<QuerySnapshot<Object?>> onSearch(){
    setState(() {
      
    });
    return Database.getlistchallenge('levinacharin7@gmail.com');
  }
  //Stream<QuerySnapshot<Object?>> txtsearch = Database.getlistchallenge('levinacharin7@gmail.com');

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
                  Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: onSearch(),
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('ERROR');
                              }else if(snapshot.hasData || snapshot.data != null){
                                return ListView.separated(
                                  itemBuilder: (context, index){
                                    DocumentSnapshot dsData = snapshot.data!.docs[index];
                                    //mengambil data per index ke dalam variabel data
                                    String c_status = dsData['status'];
                                    //String lvIsi = dsData['isiCat'];
                                    _jumlah = snapshot.data!.docs.length;
                                    return ListTile(
                                      
                                      title: Text(c_status),
                                      //subtitle: Text(lvIsi),
                                    );
                                  }, 
                                  separatorBuilder: (context, index) => const SizedBox(height: 20.0,), 
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
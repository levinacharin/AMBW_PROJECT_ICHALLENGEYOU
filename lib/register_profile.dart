import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/service/service.dart';

class RegisterMenu extends StatefulWidget {
  const RegisterMenu({Key? key}) : super(key: key);

  @override
  State<RegisterMenu> createState() => _RegisterMenuState();
}

class _RegisterMenuState extends State<RegisterMenu> {
  DateTime _dateTime = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
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
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Stack(
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
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 199, 117, 50),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        '${_dateTime.year}/${_dateTime.month}/${_dateTime.day}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 199, 117, 50),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: _dateTime,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) return;
                          setState(() {
                            _dateTime = newDate;
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: PhoneNumberController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 199, 117, 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getChallenges();
          },
          child: Icon(Icons.check),
          backgroundColor: Color.fromARGB(255, 199, 117, 50),
        ));
  }
}

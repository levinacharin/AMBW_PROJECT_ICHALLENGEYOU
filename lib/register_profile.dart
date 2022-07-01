import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/main.dart';
import 'dbservices.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  DateTime _dateTime = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController UserController = TextEditingController();
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
            children: [
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
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                      style: TextStyle(
                        color: Color.fromARGB(255, 199, 117, 50),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 199, 117, 50),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: UserController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Username",
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
            registerUser(
                nameController.text,
                '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                PhoneNumberController.text,
                UserController.text);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: Icon(Icons.arrow_forward),
          backgroundColor: Color.fromARGB(255, 199, 117, 50),
        ));
  }
}

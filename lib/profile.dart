import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichallengeyouapp/notifservices.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  late final LocalNotificationServices service;

  @override
  void initState() {
    // TODO: implement initState
    service = LocalNotificationServices();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await service.showNotification(
                    id: 0, 
                    title: 'Notification Title', 
                    body: 'NotificationB Body'
                  );
                }, 
                child: Text("Show Notifikasi")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
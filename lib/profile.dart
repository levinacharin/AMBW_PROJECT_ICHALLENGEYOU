import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 207, 102, 16),
      ),
      title: const Text(
        "PROFILE",
        style: TextStyle(
          color: Color.fromARGB(255, 207, 102, 16),
        ),
      ),
    ));
  }
}

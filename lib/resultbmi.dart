import 'package:flutter/material.dart';

class resultBMI extends StatefulWidget {
  const resultBMI({Key? key}) : super(key: key);

  @override
  State<resultBMI> createState() => _resultBMIState();
}

class _resultBMIState extends State<resultBMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Challenge You",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("I Challenge You"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          color: Colors.orange[50],
        ),
      ),
    );
  }
}
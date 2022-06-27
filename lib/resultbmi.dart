import 'package:flutter/material.dart';

class resultBMI extends StatefulWidget {
  final String resultbmi;
  final String resultdescription;
  const resultBMI({Key? key, required this.resultbmi, required this.resultdescription}) : super(key: key);

  @override
  State<resultBMI> createState() => _resultBMIState();
}

class _resultBMIState extends State<resultBMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I Challenge You",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("I Challenge You"),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          color: Colors.orange[50],
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "I Challenge You",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20,),
                
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("BMI : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 20,),
                            Text("${widget.resultbmi}", style: TextStyle(fontSize: 22),),
                          ],
                        ),
                        
                        Image.asset(
                          "assets/images/bmi_table.jpg",
                          width: 300,
                          height: 200,
                        ),
                        
                        const SizedBox(height: 20,),
                        
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: 
                            Text("${widget.resultdescription}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  ),
                ),
                
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, 
                
                child: const Text("Back to Calculator")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

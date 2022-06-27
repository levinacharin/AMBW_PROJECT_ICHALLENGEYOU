import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/resultbmi.dart';
class bmi extends StatefulWidget {
  const bmi({ Key? key }) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController _tfheightController = TextEditingController();
  TextEditingController _tfweightController = TextEditingController();

  String _height = "";
  String _weight = "";
  double _heightinmeter = 0;
  double _bmicalculate = 0;

  String _bmiresult = "";
  String _bmiresultdescription = "";

  @override
  void dispose() {
    // TODO: implement dispose
    _tfheightController.dispose();
    _tfweightController.dispose();
    super.dispose();
  }


  // FUNCTION
  void calculatethebmi() {
    _height = _tfheightController.text;
    _weight = _tfweightController.text;

    _heightinmeter = double.parse(_height) / 100;
    _bmicalculate = double.parse(_weight);

    _bmicalculate = _bmicalculate / (_heightinmeter * _heightinmeter);
    _bmiresult = double.parse((_bmicalculate).toStringAsFixed(1)).toString();

    if (_bmicalculate < 18.5) {
      _bmiresultdescription = "Anda termasuk kategori UNDERWEIGHT \n" + 
      "Perbanyak asupan makanan bergizi agar mencapai berat badan ideal";
    } else if (_bmicalculate >= 18.5 && _bmicalculate <= 24.9) {
      _bmiresultdescription = "Anda termasuk kategori NORMAL \n" + 
      "Pertahankan berat badan ideal anda dengan makanan sehat dan olahraga";
    } else if (_bmicalculate >= 25 && _bmicalculate <= 29.9) {
      _bmiresultdescription = "Anda termasuk kategori OVERWEIGHT \n" + 
      "Kurangi berat badan anda dengan berolahraga dan mengurangi asupan kalori";
    } else if (_bmicalculate >= 30 && _bmicalculate <= 40) {
      _bmiresultdescription = "Anda termasuk kategori OBESE \n" + 
      "Kurangi berat badan anda dengan berolahraga dan mengurangi asupan kalori";
    } else if (_bmicalculate > 18.5) {
      _bmiresultdescription = "Anda termasuk kategori UNDERWEIGHT \n" + 
      "Kurangi berat badan anda dengan berolahraga dan mengurangi asupan kalori";
    }
  }
  // END OF FUNCTION

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I Challenge You",
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("I Challenge You"),
        // ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          color: Colors.orange[50],
          child: Wrap (
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("I Challenge You", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    elevation: 10,
                    child: Container (
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text("BMI Calculator", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          
                          const SizedBox(height: 20,),
                          
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Input your height (cm)",
                            ),
                            controller: _tfheightController,
                          ),
                          
                          const SizedBox(height: 20,),
                          
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Input your weight (kg)",
                            ),
                            controller: _tfweightController,
                          ),
                          
                          const SizedBox(height: 30,),
                          
                          ElevatedButton(onPressed: () {
                            calculatethebmi();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => resultBMI(resultbmi: _bmiresult, resultdescription: _bmiresultdescription,)));
                          }, child: Text("calculate")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),


        // body: Container(
        //   child: Column(
        //         children: [
        //           Container(
        //             padding: EdgeInsets.fromLTRB(133, 50, 133, 50),
        //             decoration: new BoxDecoration(
        //               color: Colors.orange[50]
        //             ),
        //             child: Text("I Challenge You",
        //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        //           ),
        //           Container(
        //             padding: EdgeInsets.all(20),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Container(
        //                   child: Text("BMI CALCULATOR")),
        //                 Container(
        //                   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                     Icon(Icons.person),
        //                     Icon(Icons.person)
        //                   ],),
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        //                   child: Column(children: [
        //                   Text("Input Your Age:"),
        //                   TextField(
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.grey[350],
        //                       border: OutlineInputBorder(),
        //                     ),
        //                   )
        //                   ],),)
        //                 ,
        //                 Container(
        //                   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        //                   child: Column(children: [
        //                   Text("Input Your Height (cm):"),
        //                   TextField(
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.grey[350],
        //                       border: OutlineInputBorder(),
        //                     ),
        //                   )
        //                   ],),)
        //                 ,
        //                 Container(
        //                   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        //                   child: Column(children: [
        //                   Text("Input Your Weight (kg):"),
        //                   TextField(
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.grey[350],
        //                       border: OutlineInputBorder(),
        //                     ),
        //                   )
        //                   ],),)
        //                 ,
        //               ],
        //             ),
        //           ),
        //           ElevatedButton(onPressed: (){}, child: Text("SUBMIT"))
        //         ],
        //       )
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.calculate, color: Colors.blue,),
        //         //title: new Text("BMI",)
        //     ),
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.assignment),
        //         //title: new Text("Challenges")
        //     ),
        //     BottomNavigationBarItem(
        //         icon: new Icon(Icons.account_circle),
        //         //title: new Text("Profile")
        //     ),
            
                
        //   ],
        // ),
      ),
    );
  }
}
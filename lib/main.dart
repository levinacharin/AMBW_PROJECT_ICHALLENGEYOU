// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ichallengeyouapp/bmi.dart';
import 'package:ichallengeyouapp/challenges.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ichallengeyouapp/firebase_options.dart';
import 'package:ichallengeyouapp/profile.dart';
import 'package:ichallengeyouapp/register_profile.dart';

import 'firebase_options.dart';
import 'LoginMenu.dart';

// import 'dataclass.dart';
// import 'dbservices.dart';
// import 'detdata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "ICHALLENGEYOU",
    home: RegisterMenu(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bottom navbar
  int currentIndex = 1;
  final screens = [bmi(), challenges(), profiles()];
  // end of bottom navbar

  // final _searchText = TextEditingController();
  // @override
  // void dispose(){
  //   _searchText.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState(){
  //   _searchText.addListener(onSearch);
  //   super.initState();
  // }

  // Stream<QuerySnapshot<Object?>> onSearch(){
  //   setState(() {

  //   });
  //   return Database.getData(_searchText.text);
  // }

  // int _jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ICHALLENGEYOU"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // _jumlah++;
      //     // final dtBaru = itemCatatan(itemJudul: _jumlah.toString(), itemIisi: "33334");
      //     // Database.tambahData(item: dtBaru);

      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>detData()));
      //   },
      //   backgroundColor: Colors.blueGrey,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 32,
      //   ),
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Challengess',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
      ),

      // Container(
      //   margin: EdgeInsets.fromLTRB(8, 20, 8, 8),
      //   child: Column(
      //     children: [
      //       TextField(
      //         controller: _searchText,
      //         decoration: InputDecoration(
      //           prefixIcon: Icon(Icons.search),
      //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
      //           borderSide: BorderSide(color: Colors.blue)),
      //         ),
      //       ),
      //       Expanded(
      //         child: StreamBuilder<QuerySnapshot>(
      //           stream: onSearch(),
      //           builder: (context,snapshot){
      //             if(snapshot.hasError){
      //               return Text('ERROR');
      //             }else if(snapshot.hasData || snapshot.data != null){
      //               return ListView.separated(
      //                 itemBuilder: (context, index){
      //                   DocumentSnapshot dsData = snapshot.data!.docs[index];
      //                   //mengambil data per index ke dalam variabel data
      //                   String lvJudul = dsData['judulCat'];
      //                   String lvIsi = dsData['isiCat'];
      //                   _jumlah = snapshot.data!.docs.length;
      //                   return ListTile(
      //                     onTap: (){
      //                       final dtBaru = itemCatatan(itemJudul: lvJudul, itemIisi: lvIsi);
      //                       // Database.ubahData(item: dtBaru);
      //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>detData(dataDet: dtBaru)));
      //                     },
      //                     onLongPress: (){
      //                       Database.hapusData(judulhapus: lvJudul);
      //                     },
      //                     title: Text(lvJudul),
      //                     subtitle: Text(lvIsi),
      //                   );
      //                 },
      //                 separatorBuilder: (context, index) => const SizedBox(height: 8.0,),
      //                 itemCount: snapshot.data!.docs.length
      //                 );
      //             }
      //             return Center(
      //               child: CircularProgressIndicator(
      //                 valueColor: AlwaysStoppedAnimation<Color>(
      //                   Colors.pinkAccent,

      //                 )),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

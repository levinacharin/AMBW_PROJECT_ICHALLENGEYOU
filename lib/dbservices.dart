//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ichallengeyouapp/dataclass.dart';

//CollectionReference tblCatatan = FirebaseFirestore.instance.collection("tblCatatan");
CollectionReference listuser = FirebaseFirestore.instance.collection("User");
CollectionReference listchallenge =
    FirebaseFirestore.instance.collection("challenges");
CollectionReference listquotes =
    FirebaseFirestore.instance.collection("Quotes");
CollectionReference listhistory = 
  FirebaseFirestore.instance.collection("History");
//DocumentReference

class Database {
  //baca data
  static Stream<QuerySnapshot> getlistchallenge(String email, String idchall) {
    //int angkallogin=0;
    // String lastLogin = "";
    // FirebaseFirestore.instance
    //     .collection('User')
    //     .doc(email)
    //     .get()
    //     .then((value) {
    //   lastLogin = value.get('lastLogin');
    //   //angkallogin=int.parse(lastLogin);
    //   //print(value.get('lastLogin'));
    // });
    // if(lastLogin!=idchall){
    //   idchall
    // }
    return listuser
        .doc(email)
        //.where(document,isEqualTo: email)
        .collection('userchallenge')
        .where("idchallenge", isEqualTo: idchall)
        .snapshots();
  }

  // baca data quotes
  static Stream<QuerySnapshot> getlistquotes(String idquotes) {
    return listquotes.where("idQuotes", isEqualTo: idquotes).snapshots();
  }

  // baca list history
  static Stream<QuerySnapshot> getDataHistory() {
    return listhistory.snapshots();
  }

  // static String getfield(String email, String idchall) {
  //   String nama='levina';
  //   listuser
  //       .doc(email)
  //       .get()
  //       .then((data){
  //         nama = data.birthdate;
  //       })
  //   nama = li
  //   return nama;

  // }

  //buat update klo dah di klik done
  static Future<void> ubahData(String email, String namadocument) async {
    listuser
        .doc(email)
        .collection("userchallenge")
        .doc(namadocument)
        .update({'status': "done"}).catchError((e) => print(e));
  }

  // health score
  static Future<void> ubahDataHealthScore(
      String email, String namadocument, String healthscore) async {
    listuser
        .doc(email)
        .collection("userchallenge")
        .doc(namadocument)
        .update({'health': healthscore}).catchError((e) => print(e));
  }

  // static Future<void> ubahstatusallnotyet(
  //     String email) async {
  //   listuser
  //       .doc(email)
  //       .collection("userchallenge")
  //       .doc()
  //       .update({'status': "notyet"}).catchError((e) => print(e));
  // }

  // //update ganti hari
  // static Future<void> gantihari(String email) async {
  //   listuser
  //       .doc(email)
  //       .collection("userchallenge")
  //       .doc()
  //       .update({'status': "notyet"}).catchError((e) => print(e));
  // }

  static Future<void> addDataHistory({required itemHistory itemH}) async {
    DocumentReference docRef = listhistory.doc(itemH.itemIdhistory);

    await docRef
      .set(itemH.toJson())
      .whenComplete(() => print("data berhasil diiput"))
      .catchError((e) => print(e));
  }

  // Stream<QuerySnapshot> getDataHistory() {
  //   return listhistory.snapshots();
  // }
}

Future<void> registerUser(String? name, String? birthdate, String? phoneNumber,
    String? username) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .set({
    'fullname': name,
    'health': "0",
    'email': auth.currentUser!.email.toString(),
    'birthdate': birthdate,
    'phoneNumber': phoneNumber,
    'statusNotification': "false",
    'username': username,
    'lastLogin': DateTime.now().day.toString(),
  });
  inputuserChallengesfromchallenge();
  return;
}

Future<void> editProfileUser(String? name, String? birthdate,
    String? phoneNumber, String? username) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .update({
    'fullname': name,
    'birthdate': birthdate,
    'phoneNumber': phoneNumber,
    'username': username,
  });
  return;
}

Future<void> inputuserChallengesfromchallenge() async {
  dataChallenges challenges;
  FirebaseFirestore.instance.collection('Challenge').get().then((value) {
    value.docs.forEach((element) {
      challenges = (dataChallenges.fromJson({
        'challengedesc': element.get('challengedesc').toString(),
        'idchallenge': element.get('idchallenge').toString(),
        'imgchallenge': element.get('imgchallenge').toString(),
        'namadocument': element.get('namadocument').toString(),
        'status': element.get('statuschallenge').toString(),
      }));
      inputUserChallenge(challenges);
    });
    return;
  });
}

class dataChallenges {
  String? challengeDesc;
  String? idChallenge;
  String? imgchallenge;
  String? namaDocument;
  String? StatusChallenge;
  dataChallenges(
      {this.challengeDesc,
      this.idChallenge,
      this.imgchallenge,
      this.namaDocument,
      this.StatusChallenge});
  factory dataChallenges.fromJson(Map<String, dynamic> json) {
    return dataChallenges(
        challengeDesc: json['challengedesc'],
        idChallenge: json['idchallenge'],
        imgchallenge: json['imgchallenge'],
        namaDocument: json['namadocument'],
        StatusChallenge: json['status']);
  }
  Map<String, dynamic> converttoMap() {
    return {
      'challengedesc': challengeDesc,
      'idchallenge': idChallenge,
      'imgchallenge': imgchallenge,
      'namadocument': namaDocument,
      'status': StatusChallenge,
    };
  }
}

Future<void> inputUserChallenge(dataChallenges challenges) async {
  Map<String, dynamic> data = challenges.converttoMap();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .collection('userchallenge')
      .doc(data['namadocument'].toString())
      .set(data);
  return;
}

Future<String> GetUsername() async {
  String username = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .get()
      .then((value) {
    username = value.get('username');
  });
  return username;
}

Future<Map<String?, dynamic>> getUserData() async {
  Map<String?, dynamic> userData = {};
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  await FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .get()
      .then((value) {
    userData = {
      'fullname': value.get('fullname'),
      'health': value.get('health'),
      'email': value.get('email'),
      'birthdate': value.get('birthdate'),
      'phoneNumber': value.get('phoneNumber'),
      'statusNotification': value.get('statusNotification'),
      'username': value.get('username'),
    };
  });
  return userData;
}

Future<bool> getLastLogin() async {
  String lastLogin = "";
  int result = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  await FirebaseFirestore.instance
      .collection('User')
      .doc(auth.currentUser!.email.toString())
      .get()
      .then((value) {
    lastLogin = value.get('lastLogin');
    DateTime currentdate = DateTime.now();
    result = int.parse(lastLogin) - int.parse(currentdate.day.toString());
  });
  if (result != 0) {
    print('beda');
    return true;
  } else {
    print('ga beda');
    print(lastLogin);
    //print(currentdate.day.toString());
    return false;
  }
}

Future<void> ubahstatusallnotyet(String? email) async {
  if (await getLastLogin() == true) {
    print('masuk ubah status');
    listuser.doc(email).collection("userchallenge").get().then((value) {
      value.docs.forEach((element) {
        element.reference.update({'status': "notyet"});
      });
    });
    //.update({'status': "notyet"}).catchError((e) => print(e));
  }
}

Future<List<String>> getQuotes() async {
  List<String> quotes = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();
  await FirebaseFirestore.instance.collection('Quotes').get().then((value) {
    value.docs.forEach((element) {
      quotes.add(element.get('value').toString());
    });
  });
  return quotes;
}

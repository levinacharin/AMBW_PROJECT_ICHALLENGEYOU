//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//CollectionReference tblCatatan = FirebaseFirestore.instance.collection("tblCatatan");
CollectionReference listuser = FirebaseFirestore.instance.collection("User");
CollectionReference listchallenge =
    FirebaseFirestore.instance.collection("challenges");
//DocumentReference

class Database {
  //baca data
  static Stream<QuerySnapshot> getlistchallenge(String email, String idchall) {
    return listuser
        .doc(email)
        //.where(document,isEqualTo: email)
        .collection('userchallenge')
        .where("idchallenge", isEqualTo: idchall)
        .snapshots();

    // if(email==""){
    //   return listuser.snapshots();
    // }else{
    //   return listuser
    //   .listchallenge
    //   //.orderBy("judulCat")
    //   //.startAt([judul]).endAt([judul+'\uf8ff'])
    //   .snapshots();
    // }
  }

  //buat update klo dah di klik done
  static Future<void> ubahData(String email, String namadocument) async {
    listuser
        .doc(email)
        .collection("userchallenge")
        .doc(namadocument)
        .update({'status': "done"}).catchError((e) => print(e));
  }

  //update ganti hari
  static Future<void> gantihari(String email) async {
    listuser
        .doc(email)
        .collection("userchallenge")
        .doc()
        .update({'status': "notyet"}).catchError((e) => print(e));
  }

  // static Stream<QuerySnapshot> getdetailchallenge(String email) {
  //   //Stream<QuerySnapshot<Object?>> listchalname = Database.getlistchallenge('levinacharin7@gmail.com');

  //   return listuser
  //   .doc("levinacharin7@gmail.com")
  //   //.where(document,isEqualTo: email)
  //   .collection('userchallenge')
  //   .snapshots();

  //   // if(email==""){
  //   //   return listuser.snapshots();
  //   // }else{
  //   //   return listuser
  //   //   .listchallenge
  //   //   //.orderBy("judulCat")
  //   //   //.startAt([judul]).endAt([judul+'\uf8ff'])
  //   //   .snapshots();
  //   // }

  // }

  //add data
  // static Future<void> tambahData({required itemCatatan item}) async {
  //   DocumentReference docRef = tblCatatan.doc(item.itemJudul);

  //   await docRef
  //   .set(item.toJson())
  //   .whenComplete(() => print("data berhasil diinput"))
  //   .catchError((e) => print(e));
  // }

  // static Future<void> hapusData({required String judulhapus}) async{
  //   DocumentReference docRef = tblCatatan.doc(judulhapus);
  //   await docRef
  //   .delete()
  //   .whenComplete(() => print("data berhasil dihapus"))
  //   .catchError((e)=>print(e));
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
  });
  inputuserChallengesfromchallenge();
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

Future<void> getUseremail() async {}

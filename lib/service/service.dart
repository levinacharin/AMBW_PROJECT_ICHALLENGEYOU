import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> registerUser(
    String? name, String? birthdate, String? phoneNumber) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser!.uid.toString();

  await FirebaseFirestore.instance
      .collection('users')
      .doc(auth.currentUser!.email.toString())
      .set({
    'name': name,
    'birthdate': birthdate,
    'phoneNumber': phoneNumber,
  });
}

Future<void> getChallenges() async {
  List<dataChallenges> challenges;
  challenges = [];
  FirebaseFirestore.instance.collection('Challenge').get().then((value) {
    value.docs.forEach((element) {
      challenges.add(dataChallenges.fromJson({
        'challengeDesc': element.get('challengedesc').toString(),
        'idChallenge': element.get('idchallenge').toString(),
        'imgchallenge': element.get('imgchallenge').toString(),
        'namaDocument': element.get('namadocument').toString(),
        'StatusChallenge': element.get('statuschallenge').toString(),
      }));
    });
    print(challenges);
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
        challengeDesc: json['challengeDesc'],
        idChallenge: json['idChallenge'],
        imgchallenge: json['imgchallenge'],
        namaDocument: json['namaDocument'],
        StatusChallenge: json['StatusChallenge']);
  }
}
